# zip
# 将可迭代的对象作为参数，将对象中对应的元素打包成一个个元组，
# 然后返回由这些元组组成的列表。
#
# 传入参数：元组、列表、字典等迭代器。
zz = zip()
print(zz, type(zz))
print(list(zz))  # []

num = [11, 22, 33, 44, 55]
zz = zip(num)
print(list(zz))  # [(11,), (22,), (33,), (44,), (55,)]

names = ['zhang', 'wang', 'li', 'yang']
ages = [18, 20, 22, 19]
print(list(zip(names, ages)))
# [('zhang', 18), ('wang', 20), ('li', 22), ('yang', 19)]

zz = list(zip(range(3), 'ABCDEF'))
print(zz)
# [(0, 'A'), (1, 'B'), (2, 'C')]

names = ['zhang', 'wang', 'li', 'yang']
ages = [18, 20, 22, 19]
for name, age in zip(names, ages):
    print(name, age)
# zhang 18
# wang 20
# li 22
# yang 19

num1 = [10, 20, 30, 5]
num2 = [5, 6, 5, 8]
operators = ['+', '-', '/', '*']
for n1, op, n2 in zip(num1, operators, num2):
    print(f'{n1}{op}{n2}={eval(str(n1) + op + str(n2))}')
# 10+5=15
# 20-6=14
# 30/5=6.0
# 5*8=40

done = {'name': 'Mike', 'last_name': 'Wei', 'job': 'Python'}
dtwo = {'name': 'Sanse', 'last_name': 'Doe', 'job': 'Manager'}
for (k1, v1), (k2, v2) in zip(done.items(), dtwo.items()):
    print(k1, v1)
    print(k2, v2)
# name Mike
# name Sanse
# last_name Wei
# last_name Doe
# job Python
# job Manager

names = ['zhang', 'wang', 'li', 'yang']
ages = [18, 20, 22, 19]
data = list(zip(names, ages))
print(data)  # [('zhang', 18), ('wang', 20), ('li', 22), ('yang', 19)]
# 根据字母升序排序
data.sort()
print(data)  # [('li', 22), ('wang', 20), ('yang', 19), ('zhang', 18)]

names = ['zhang', 'wang', 'li', 'yang']
ages = [18, 20, 22, 19]
stu = dict(zip(names, ages))
print(stu)
# {'zhang': 18, 'wang': 20, 'li': 22, 'yang': 19}

names = ['zhang', 'wang', 'li', 'yang']
ages = [18, 20, 22, 19]
# 转换为列表
print(list(zip(names, ages)))
# 解压
n, a = zip(*zip(names, ages))
print(n)
print(a)
# [('zhang', 18), ('wang', 20), ('li', 22), ('yang', 19)]
# ('zhang', 'wang', 'li', 'yang')
# (18, 20, 22, 19)


attributes = ['name', 'dob', 'gender']
values = [
    ['jason', '2000-01-01', 'male'],
    ['mike', '1999-01-01', 'male'],
    ['nancy', '2001-02-01', 'female']
]
result = [dict(zip(attributes, v)) for v in values]
print(result)
# [{'name': 'jason', 'dob': '2000-01-01', 'gender': 'male'},
#  {'name': 'mike', 'dob': '1999-01-01', 'gender': 'male'},
#  {'name': 'nancy', 'dob': '2001-02-01', 'gender': 'female'}]
