package mysql

import (
	"dbcmp/internal/cmp/config"
	"fmt"
	"github.com/pkg/errors"
	"gorm.io/gorm/logger"

	"time"

	"gorm.io/driver/mysql"
	"gorm.io/gorm"
	"gorm.io/gorm/schema"
)

type Repo interface {
	i()
	GetDbR() *gorm.DB
	GetDbW() *gorm.DB
	DbRClose() error
	DbWClose() error
}

type DBInfo struct {
	User, Pass, Addr, RName, WName            string
	MaxOpenConn, MaxIdleConn, ConnMaxLifeTime int
}

type dbRepo struct {
	DbR *gorm.DB
	DbW *gorm.DB
}

func New(mysqlConf config.Mysql) (Repo, error) {

	var dbInfo = DBInfo{mysqlConf.Name,
		mysqlConf.Pass,
		mysqlConf.Addr,
		mysqlConf.Rdb,
		mysqlConf.Wdb,
		mysqlConf.MaxOpenConn,
		mysqlConf.MaxIdleConn,
		mysqlConf.ConnMaxLifeTime,
	}

	dbr, err := dbConnect(dbInfo.User, dbInfo.Pass, dbInfo.Addr, dbInfo.RName, dbInfo.MaxOpenConn, dbInfo.MaxIdleConn, dbInfo.ConnMaxLifeTime)
	if err != nil {
		return nil, err
	}

	dbw, err := dbConnect(dbInfo.User, dbInfo.Pass, dbInfo.Addr, dbInfo.WName, dbInfo.MaxOpenConn, dbInfo.MaxIdleConn, dbInfo.ConnMaxLifeTime)
	if err != nil {
		return nil, err
	}

	return &dbRepo{
		DbR: dbr,
		DbW: dbw,
	}, nil
}

func (d *dbRepo) i() {}

func (d *dbRepo) GetDbR() *gorm.DB {
	return d.DbR
}

func (d *dbRepo) GetDbW() *gorm.DB {
	return d.DbW
}

func (d *dbRepo) DbRClose() error {
	sqlDB, err := d.DbR.DB()
	if err != nil {
		return err
	}
	return sqlDB.Close()
}

func (d *dbRepo) DbWClose() error {
	sqlDB, err := d.DbW.DB()
	if err != nil {
		return err
	}
	return sqlDB.Close()
}

func dbConnect(user, pass, addr, dbName string, maxOpenConn, maxIdleConn, connMaxLifeTime int) (*gorm.DB, error) {
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s?charset=utf8mb4&parseTime=%t&loc=%s",
		user,
		pass,
		addr,
		dbName,
		true,
		"Local")

	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{
		NamingStrategy: schema.NamingStrategy{
			SingularTable: true,
		},
		Logger: logger.Default.LogMode(logger.Info)}) //是否打印日志

	if err != nil {
		return nil, errors.Wrap(err, fmt.Sprintf("[db connection failed] Database name: %s", dbName))
	}

	db.Set("gorm:table_options", "CHARSET=utf8mb4")

	sqlDB, err := db.DB()
	if err != nil {
		return nil, err
	}

	// 设置连接池 用于设置最大打开的连接数，默认值为0表示不限制.设置最大的连接数，可以避免并发太高导致连接mysql出现too many connections的错误。
	sqlDB.SetMaxOpenConns(maxOpenConn)

	// 设置最大连接数 用于设置闲置的连接数.设置闲置的连接数则当开启的一个连接使用完成后可以放在池里等候下一次使用。
	sqlDB.SetMaxIdleConns(maxIdleConn)
	// 设置最大连接超时
	sqlDB.SetConnMaxLifetime(time.Minute * time.Duration(connMaxLifeTime))

	return db, nil
}
