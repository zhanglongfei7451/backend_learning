from django.urls import path
from . import views

app_name = 'blog'

urlpatterns = [
    path('', views.index, name='index'),
    path('article_detail/<int:id>', views.article_detail, name='article_detail'),
    path('article_create/', views.article_create, name='article_create'),
    path('article_update/<int:id>', views.article_update, name='article_update'),

    path('register/', views.register, name='register'),
    path('login/', views.login, name='login')
]