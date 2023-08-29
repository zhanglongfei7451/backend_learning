import xadmin
from .models import *

# Create your models here.
class CourseInfoXadmin(object):
    list_display = ['image','name','study_num','level','love_num','category','orginfo','teacherinfo']


class LessonInfoXadmin(object):
    list_display = ['name', 'courseinfo', 'add_time']


class VideoInfoXadmin(object):
    list_display = ['name', 'study_time', 'url','lessoninfo']


class SourceInfoXadmin(object):
    list_display = ['name', 'down_load', 'courseinfo', 'add_time']

xadmin.site.register(CourseInfo,CourseInfoXadmin)
xadmin.site.register(LessonInfo,LessonInfoXadmin)
xadmin.site.register(VideoInfo,VideoInfoXadmin)
xadmin.site.register(SourceInfo,SourceInfoXadmin)