from django.shortcuts import render
from .forms import UserAskForm,UserCommentForm
from django.http import JsonResponse
from .models import UserLove,UserComment
from orgs.models import OrgInfo,TeacherInfo
from courses.models import CourseInfo
from django.core.serializers import serialize
from tools.decorators import login_decorator
# Create your views here.
def user_ask(request):
    user_ask_form = UserAskForm(request.POST)
    if user_ask_form.is_valid():
        user_ask_form.save(commit=True)
        # name = user_ask_form.cleaned_data['name']
        # phone = user_ask_form.cleaned_data['phone']
        # course = user_ask_form.cleaned_data['course']
        #
        # a = UserAsk()
        # a.name = name
        # a.phone = phone
        # a.course = course
        # a.save()
        return JsonResponse({'status':'ok','msg':'咨询成功'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '咨询失败'})

@login_decorator
def user_love(request):
    loveid = request.GET.get('loveid','')
    lovetype = request.GET.get('lovetype','')
    if loveid and lovetype:
        #根据传递过来的收藏类型，判断是什么对象，根据传递过来的收藏id，判断收藏的是哪一个对象。
        obj = None
        if int(lovetype) == 1:
            obj = OrgInfo.objects.filter(id = int(loveid))[0]
        if int(lovetype) == 2:
            obj = CourseInfo.objects.filter(id = int(loveid))[0]
        if int(lovetype) == 3:
            obj = TeacherInfo.objects.filter(id = int(loveid))[0]

        #如果收藏的id和type同时存在，那么我们首先要去到收藏表当中去查找有没有这个用户的这个收藏记录
        love = UserLove.objects.filter(love_id=int(loveid),love_type=int(lovetype),love_man=request.user)
        if love:
            #如果本来已经存在收藏这个东西的记录，那么我们需要判断收藏的状态，如果收藏状态为真，代表之前收藏过，并且现在的页面上应显示的是取消收藏，代表着这次点击是为了取消收藏
            if love[0].love_status:
                love[0].love_status = False
                love[0].save()
                obj.love_num -= 1
                obj.save()
                return JsonResponse({'status':'ok','msg':'收藏'})
            # 如果收藏状态为假，代表之前收藏过，并且又取消了收藏，并且现在的页面上应显示的是收藏，代表着这次点击是为了收藏
            else:
                love[0].love_status = True
                love[0].save()
                obj.love_num += 1
                obj.save()
                return JsonResponse({'status': 'ok', 'msg': '取消收藏'})
        else:
            #如果之前没有收藏过这个东西，那么代表着表当中没有这个记录，所以，我们需要先创建这个记录对象，然后把这个记录的状态改为True
            a = UserLove()
            a.love_man = request.user
            a.love_id = int(loveid)
            a.love_type = int(lovetype)
            a.love_status = True
            a.save()
            obj.love_num += 1
            obj.save()
            return JsonResponse({'status': 'ok', 'msg': '取消收藏'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '收藏失败'})

def user_comment(request):
    user_comment_form = UserCommentForm(request.POST)
    if user_comment_form.is_valid():
        course = user_comment_form.cleaned_data['course']
        content = user_comment_form.cleaned_data['content']
        a = UserComment()
        a.comment_man = request.user
        a.comment_content = content
        a.comment_course_id = course
        a.save()

        # all_comments = UserComment.objects.filter(comment_course_id=course)
        #
        # all_comments = serialize('json',all_comments)
        #
        # return JsonResponse(all_comments,safe=False)
        return JsonResponse({'status':'ok','msg':'评论成功'})
    else:
        return JsonResponse({'status':'fail','msg':'评论失败'})

def user_deletelove(request):
    loveid = request.GET.get('loveid','')
    lovetype = request.GET.get('lovetype','')
    if loveid and lovetype:
        love = UserLove.objects.filter(love_id=int(loveid),love_type=int(lovetype),love_man=request.user,love_status=True)
        if love:
            love[0].love_status = False
            love[0].save()
            return JsonResponse({'status':'ok','msg':'取消成功'})
        else:
            return JsonResponse({'status': 'fail', 'msg': '取消失败'})
    else:
        return JsonResponse({'status': 'fail', 'msg': '取消失败'})


