package mysql

import (
	"dbcmp/internal/cmp/config"
	log "github.com/sirupsen/logrus"
	"gorm.io/gorm"
)

var MasterDbR *gorm.DB
var MasterDbW *gorm.DB

var SlaveDbR *gorm.DB
var SlaveDbW *gorm.DB

func InitDB() {
	log.Info("初始化数据库")
	masterRepo, err := New(config.Config.MasterMysqlConf)

	if err != nil {
		log.Fatal(err.Error()) //关闭服务进程
	}
	MasterDbR = masterRepo.GetDbR()
	MasterDbW = masterRepo.GetDbW()

	slaveRepo, err := New(config.Config.SlaveMysqlConf)
	if err != nil {
		log.Fatal(err.Error()) //关闭服务进程
	}

	SlaveDbR = slaveRepo.GetDbR()
	SlaveDbW = slaveRepo.GetDbW()

}
