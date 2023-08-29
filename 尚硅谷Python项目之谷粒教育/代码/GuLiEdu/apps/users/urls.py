"""GuLiEdu URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/1.11/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  url(r'^$', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  url(r'^$', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.conf.urls import url, include
    2. Add a URL to urlpatterns:  url(r'^blog/', include('blog.urls'))
"""
from django.conf.urls import url
from .views import user_register,UserLoginView,user_logout,user_active,user_forget,user_reset,user_info,user_changeimage,user_changeinfo,user_changeemail,user_resetemail,user_course,user_loveteacher,user_loveorg,user_lovecourse,user_message,user_deletemessage
urlpatterns = [
    url(r'^user_register/$',user_register,name='user_register'),
    url(r'^user_login/$', UserLoginView.as_view(), name='user_login'),
    url(r'^user_logout/$', user_logout, name='user_logout'),
    url(r'^user_active/(\w+)/$', user_active, name='user_active'),

    url(r'^user_forget/$', user_forget, name='user_forget'),
    url(r'^user_reset/(\w+)/$', user_reset, name='user_reset'),

    url(r'^user_info/$',user_info,name='user_info'),

    url(r'^user_changeimage/$',user_changeimage,name='user_changeimage'),
    url(r'^user_changeinfo/$', user_changeinfo, name='user_changeinfo'),
    url(r'^user_changeemail/$',user_changeemail,name='user_changeemail'),
    url(r'^user_resetemail/$', user_resetemail, name='user_resetemail'),

    url(r'^user_course/$',user_course,name='user_course'),
    url(r'^user_loveorg/$', user_loveorg, name='user_loveorg'),
    url(r'^user_loveteacher/$', user_loveteacher, name='user_loveteacher'),
    url(r'^user_lovecourse/$', user_lovecourse, name='user_lovecourse'),

    url(r'^user_message/$', user_message, name='user_message'),
    url(r'^user_deletemessage/$', user_deletemessage, name='user_deletemessage'),

]
