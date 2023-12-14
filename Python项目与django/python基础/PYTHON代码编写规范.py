# GET /student/{id}/
# 根据id获取学生信息
# RESPONSE
# {id:学生ID;
#  class:班级ID;
#  age:年龄;
#  name:名称}


# GET /class/{id}/
# 根据id获取班级信息
# RESPONSE
# {id:班级ID;
#  name:班级名称}


import json
from urllib.request import urlopen

# 打开请求
response = urlopen(url)
# 反序列化响应内容
json.loads(response.read())
# 关闭请求
response.close()


def get(endpoint, studdent):
    result = None
    try:
        info1 = urlopen(f"{endpoint}/student/{student}/")  # 获取学生信息
        if info1.status_code == 200:
            result = json.loads(info1.read())  # 解析学生信息
            info1.close()
            result2 = urlopen(f"{endpoint}/class/{result1['class']}/")  # 获取班级信息
            if result2.status_code == 200:
                info2 = json.loads(result2.read())  # 解析班级信息
                result = info2["name"]  # 获取班级名称
                result2.close()
            else:
                result2.close()
        else:
            info1.close()
    except Exception:
        return "unknown"
    return result


# 包名、模块名、局部变量名、函数名——全小写+下划线：this_is_var
# 全局变量——全小写+下换线：GLOVAl_VAR
# 类名——首字母大写驼峰：ClassName


# 变量名具备描述性
# BAD:day/host/cards/temp
# GOOD:day_of_week/hosts_to_reboot/expired_cards

# 好名字能让人猜出来类型

# 什么样的名字会被当成bool类型
# is_superuser、has_error、allow_vip、use_msgpack、debug

# 什么样的名字会被当成数值类型
# port/age/radius
# user_id/host_id等以id结尾的名字
# length_of_username/max_length/users_count等以length、count结尾的名字


def get_class_name_by_student_id(endpoint: str, student_id: int) -> str:
    class_name = None
    return class_name


# 保持同类变量名的一致性
# 同一个变量指代的变量类型也需要保持一致性
# 同一个代码中不要使用相似的变量名

# 代码中info1、infor2、result1/result2-很让人难受
try:
    student_response = urlopen(f"{endpoint}/student/{student_id}/")  # 获取学生信息
    if student_response.status_code == 200:
        student_info = json.loads(student_response.read())  # 解析学生信息
        student_response.close()

        class_response = urlopen(f"{endpoint}/class/{student_info['class']}/")  # 获取班级信息
        if class_response.status_code == 200:
            class_info = json.loads(class_response.read())  # 解析班级信息
            class_name = class_info["name"]  # 获取班级名称
            class_response.close()
        else:
            class_response.close()
    else:
        student_response.close()
except Exception:
    return "unknown"

# 避免分支嵌套——俗称嵌套地狱
# 优化技巧——以前结束return或者raise
try:
    student_response = urlopen(f"{endpoint}/student/{student_id}/")  # 获取学生信息
    if student_response.status_code != 200:
        student_response.close()
        return "unknown"

    student_info = json.loads(student_response.read())  # 解析学生信息
    student_response.close()

    class_response = urlopen(f"{endpoint}/class/{student_info['class']}/")  # 获取班级信息
    if class_response.status_code != 200:
        class_response.close()
        return "unknown"

    class_info = json.loads(class_response.read())  # 解析班级信息
    class_name = class_info["name"]  # 获取班级名称
    class_response.close()
except Exception:
    return "unknown"

# 重复代码是代码质量的天敌
try:
    with urlopen(f"{endpoint}/student/{student_id}/") as student_response:  # 获取学生信息
        if student_response.status_code != 200:
            return "unknown"
        student_info = json.loads(student_response.read())  # 解析学生信息

    with urlopen(f"{endpoint}/class/{student_info['class']}/") as class_response:  # 获取班级信息
        if class_response.status_code != 200:
            return "unknown"
        class_info = json.loads(class_response.read())  # 解析班级信息
        class_name = class_info["name"]  # 获取班级名称
except Exception:
    return "unknown"


# 封装
class HTTPError(Exception):
    pass


def raise_for_status(response='HttpResponse'):
    if response.status_code != 200:
        raise HTTPError()


try:
    with urlopen(f"{endpoint}/student/{student_id}/") as student_response:  # 获取学生信息
        raise_for_status(student_response)
        student_info = json.loads(student_response.read())  # 解析学生信息

    with urlopen(f"{endpoint}/class/{student_info['class']}/") as class_response:  # 获取班级信息
        raise_for_status(student_response)
        class_info = json.loads(class_response.read())  # 解析班级信息
        class_name = class_info["name"]  # 获取班级名称
except Exception:
    return "unknown"


# 还有重复性代码！
# 封装
class HTTPError(Exception):
    pass


def raise_for_status(response='HttpResponse'):
    if response.status_code != 200:
        raise HTTPError()


def request_get(endpoint: str, path: str) -> dict:
    with urlopen(f"{endpoint}/{path}") as response:
        raise_for_status(response)
        return json.loads(response.read())


def get_class_name_by_student_id(endpoint: str, student_id: int) -> str:
    class_name = None
    try:
        student_info = request_get(endpoint, f"student/{student_id}/")
        class_info = request_get(endpoint, f"class/{student_info['class']}/")
        class_name = class_info["name"]  # 获取班级名称
    except Exception:
        return "unknown"
    return class_name


'''
无处不在的异常
导入不存在模块时：ImportError
数组访问超出范围：IndexError
字段找不到对应键值：KeyError
引用未定义变量：NameError
访问属性失败时：AttributeError
类型不匹配：TypeError
'''

# 永远只捕获可能异常的语句快
# 永远只捕获精确地异常类型
# 可忽略的异常捕获之后，试着记个日志

from urllib import error


def get_class_name_by_student_id(endpoint: str, student_id: int) -> str:
    class_name = None
    try:
        student_info = request_get(endpoint, f"student/{student_id}/")
    except (error.URLError, error.HTTPError, error.ContentTooShortError) as e:
        logger.warning("request student info failed : %s", e)
        return "unknown"

    try:
        class_info = request_get(endpoint, f"class/{student_info['class']}/")
    except (error.URLError, error.HTTPError, error.ContentTooShortError) as e:
        logger.warning("request student info failed : %s", e)
        return "unknown"
    class_name = class_info["name"]  # 获取班级名称
    return class_name


# 优化异常处理

def request_get(endpoint: str, path: str) -> dict:
    try:
        with urlopen(f"{endpoint}/{path}") as response:
            raise_for_status(response)
            return json.loads(response.read())
    except (error.URLError, error.HTTPError, error.ContentTooShortError, socket.timeout) as e:
        raise HTTPError() from e

def get_class_name_by_student_id(endpoint: str, student_id: int) -> str:
    class_name = None
    try:
        student_info = request_get(endpoint, f"student/{student_id}/")
    except HTTPError as e:
        logger.warning("request student info failed : %s", e)
        return "unknown"

    try:
        class_info = request_get(endpoint, f"class/{student_info['class']}/")
    except HTTPError as e:
        logger.warning("request student info failed : %s", e)
        return "unknown"
    class_name = class_info["name"]  # 获取班级名称
    return class_name

# 防御性编程

def get_class_name_by_student_id(endpoint: str, student_id: int) -> str:
    class_name = None
    try:
        student_info = request_get(endpoint, f"student/{student_id}/")
    except HTTPError as e:
        logger.warning("request student info failed : %s", e)
        return "unknown"

    if "class" not in student_info:
        return "unknown"

    try:
        class_info = request_get(endpoint, f"class/{student_info['class']}/")
    except HTTPError as e:
        logger.warning("request student info failed : %s", e)
        return "unknown"

    return class_info.get("name") or "unknown"

# 使用request包更为方便
def request_get(endpoint: str, path: str) -> dict:
    response = requests.get(f"{endpoint}/{path}")
    response.raise_for_status()
    return response.json()