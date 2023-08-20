# 代码简洁，不需要多次复用用完立即释放，推荐lambda表达式

def add(a, b):
    return a + b


add_lambda = lambda a, b: a + b


def get_odd_even(x):
    if x % 2 == 0:
        return 'even'
    else:
        return 'odd'


get_odd_even_lambda = lambda x: 'even' if x % 2 == 0 else 'odd'

a = [(2, "小黑"), (5, "小白"), (4, "张三"), (3, "王五")]
a.sort(key=lambda x: x[0])
print(a)

from functools import reduce


def add(num):
    return num ** 2


x = map(add, [1, 2, 3, 4, 5])
print(x)  # <map object at 0x0000023BD0AC8FA0>
print(list(x))  # [1, 4, 9, 16, 25]
print("_" * 50)

y = map(lambda num: num ** 2, [1, 2, 3, 4, 5])  # map()对序列中的每个元素进行操作，获得新的序列
print(list(y))

x = filter(lambda num: num % 2 == 0, [1, 2, 3, 4, 5])  # filter()对序列中的每个元素筛选，获得新的序列
print(list(x))  # [2, 4]

list1 = [1, 2, 3, 4, 5]
list2 = reduce(lambda x, y: x + y, list1)  # reduce()对序列中元素进行累加
print(list2)  # 15
