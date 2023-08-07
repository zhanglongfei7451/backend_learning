from django.db import models


class Article(models.Model):
    title = models.CharField('标题', max_length=200, unique=True)
    body = models.TextField('正文')
    created = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return self.title


class MyUser(models.Model):
    username = models.CharField('用户名', max_length=200, unique=True)
    password = models.CharField('密码', max_length=200)
    email = models.CharField('邮箱', max_length=200, unique=True)
