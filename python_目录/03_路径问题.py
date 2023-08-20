import os

print('---')
curlPath = os.path.dirname(os.path.abspath(__file__)) # 获取当前脚本的路径
print(curlPath)
# D:\1—SUYAN\learning\python_目录

curlPath = os.path.dirname(os.path.realpath(__file__))# 获取当前脚本的文件夹路径
print(curlPath)
# D:\1—SUYAN\learning\python_目录

