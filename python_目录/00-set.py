#  set() 函数创建一个无序不重复元素集
list1 = [1, 2, 3, 4, 4, 4]
s = set(list1)
print(s)
for i in s:
    print(i)  # 1 2 3 4
print(type(list1))
print(type(s))
