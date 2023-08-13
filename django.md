C:\............\django-admin.exe startproject 项目名称
或者加入环境变量之后  django-admin startproject 项目名称

Celery -A Django_Demo worker -l info -P eventlet
Celery -A Django_Demo worker -l info --pool=solo 

python manage.py makemigrations
python manage.py migrate

python manage.py startapp myapp

## Django-DRF
### django基础

1. CRUD小应用——MVT架构模式
2. 模型——字段(基础字段、关系字段、on_delete删除选项、related_name选项)、MTEA选项、自定义方法、自定义Manager方法
3. ORM数据查询接口--增删改查、高级Q与F方法
4. 路由——path与re_path方法、reverse()反向解析，命名空间
5. 视图——通用类视图--前后端分离，不好使用了
6. 表单设计——自定义表单forms.Form和根据模型自动生成的表单forms.ModelForm，自定义表单进行clean验证
7. 分页与通用模板——Paginator
8. 上传文件与ajax交互未看
9. 配置文件

### django进阶

1. QuerySet惰性查询，选择合适的方法(比如exists,count,update,values)减少数据库的全量访问
1. 中间件Middleware——功能为全局性
1. Signals信号机制——自定义或者全局信号，不同事件的联动，发掘应用场景

### DRF
1. 改变序列化输出内容:
    指定source、自定义序列化方法、to_representation()
2. 嵌套序列化器
    使用嵌套函数或者设置关联模型的深度
3. 关系序列化
4. 数据验证
	字段级别验证和对象级别验证、序列化器
5. 重写序列化器中的create和update方法