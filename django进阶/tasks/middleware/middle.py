import time
from django.shortcuts import redirect
from django.conf import settings


def timeit_middleware(get_response):
    def middleware(request):
        start = time.time()
        response = get_response(request)
        end = time.time()
        print("请求花费时间: {}秒".format(end - start))
        return response

    return middleware


# class LoginRequiredMiddleware:
#     def __init__(self, get_response):
#         self.get_response = get_response
#         self.login_url = settings.LOGIN_URL
#         # 开放白名单，比如['/login/', '/admin/']
#         self.open_urls = [self.login_url] + getattr(settings, 'OPEN_URLS', [])
#
#     def __call__(self, request):
#         if not request.user.is_authenticated and request.path_info not in self.open_urls:
#             return redirect(self.login_url + '?next=' + request.get_full_path())
#
#         response = self.get_response(request)
#         return response