from django.db import models
from django.contrib.auth.models import AbstractUser
from datetime import datetime
# Create your models here.
class UserProfile(AbstractUser):
    image = models.ImageField(upload_to='user/',max_length=200,verbose_name="用户头像",null=True,blank=True)
    nick_name = models.CharField(max_length=20,verbose_name="用户昵称",null=True,blank=True)
    birthday = models.DateField(verbose_name="用户生日",null=True,blank=True)
    gender = models.CharField(choices=(('girl','女'),('boy','男')),max_length=10,verbose_name="用户性别",default='girl')
    address = models.CharField(max_length=200,verbose_name="用户地址",null=True,blank=True)
    phone = models.CharField(max_length=11,verbose_name="用户手机",null=True,blank=True)
    #这个字段控制激活
    is_start = models.BooleanField(default=False,verbose_name="是否激活")
    add_time = models.DateTimeField(default=datetime.now,verbose_name="添加时间")

    def __str__(self):
        return self.username

    def get_msg_counter(self):
        from operations.models import UserMessage
        counter = UserMessage.objects.filter(message_man = self.id,message_status=False).count()
        return counter


    class Meta:
        verbose_name = '用户信息'
        verbose_name_plural = verbose_name


class BannerInfo(models.Model):
    image = models.ImageField(upload_to='banner/',verbose_name="轮播图片",max_length=200)
    url = models.URLField(default='http://www.atguigu.com',max_length=200,verbose_name="图片链接")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return str(self.image)

    class Meta:
        verbose_name = '轮播图信息'
        verbose_name_plural = verbose_name


class EmailVerifyCode(models.Model):
    code = models.CharField(max_length=20,verbose_name="邮箱验证码")
    email = models.EmailField(max_length=200,verbose_name="验证码邮箱")
    send_type = models.IntegerField(choices=((1,'register'),(2,'forget'),(3,'change')),verbose_name="验证码类型")
    add_time = models.DateTimeField(default=datetime.now, verbose_name="添加时间")

    def __str__(self):
        return self.code

    class Meta:
        verbose_name = '邮箱验证码信息'
        verbose_name_plural = verbose_name