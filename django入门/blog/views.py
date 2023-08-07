from django.shortcuts import render, get_object_or_404, redirect, HttpResponse
from .models import Article, MyUser
from .form import RegistrationForm
from django.http import HttpResponseRedirect

from django.core import serializers
from django.http import JsonResponse
from django.core.paginator import Paginator, EmptyPage, PageNotAnInteger


# Create your views here.
# 展示所有文章
def index(request):
    latest_articles = Article.objects.all().order_by('created')
    paginator = Paginator(latest_articles, 5)
    page = request.GET.get('page')  # 从url的get请求的参数中获取页码
    try:
        page_obj = paginator.page(page)
    except PageNotAnInteger:
        page_obj = paginator.page(1)  # 如果传入page参数不是整数，默认第一页
    except EmptyPage:
        page_obj = paginator.page(paginator.num_pages)
    is_paginated = True if paginator.num_pages > 1 else False  # 如果页数小于1不使用分页
    context = {'page_obj': page_obj, 'is_paginated': is_paginated}
    # return HttpResponse(context)
    data_Json = serializers.serialize('json', page_obj)
    return JsonResponse(data_Json, safe=False)


# 展示一篇文章
def article_detail(request, id):
    article = get_object_or_404(Article, pk=id)
    return HttpResponse(article)


def article_create(request):
    if request.method == 'POST':
        title = request.POST['title']
        body = request.POST['body']
        article = Article(title=title, body=body)
        article.save()
        latest_articles = Article.objects.all().order_by('-created')
        print(latest_articles)
        return HttpResponse(latest_articles)
    else:
        return HttpResponse('仅支持POST上传')


# 更新文章


def article_update(request, id):
    # 如果用户通过POST提交，通过request.POST获取提交数据
    if request.method == 'POST':
        # 将用户提交数据与ArticleForm表单绑定，进行验证
        title = request.POST['title']
        body = request.POST['body']
        print('--------------------')
        article = Article.objects.filter(pk=id).update(title=title, body=body)
        latest_articles = Article.objects.all().order_by('-created')
        return HttpResponse(latest_articles)
    else:
        return HttpResponse('仅支持POST修改')


def register(request):
    if request.method == 'POST':
        form = RegistrationForm(request.POST)
        if form.is_valid():
            print('----------------')
            # 数据有效，将会把数据存储再cleaned_data字典中去
            username = form.cleaned_data['username']
            email = form.cleaned_data['email']
            password = form.cleaned_data['password1']
            p = MyUser.objects.create(username=username, email=email, password=password)
            print('----------------')
            all_user = MyUser.objects.all()
            # return HttpResponseRedirect("/blog/login/")
            return HttpResponse(all_user)
        else:
            return HttpResponse('注册失败')
    else:
        return HttpResponse('注册请用POST方式')


def login(request):
    return HttpResponse('这是登录页面')
