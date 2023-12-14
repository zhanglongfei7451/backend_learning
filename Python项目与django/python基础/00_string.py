# -*- coding:utf8-*-
# 基础篇:05深入浅出字符串


if __name__ == "__main__":
    name = 'aaa'
    city = "bbb"
    text = """ccc"""
    print(name, city, text)  # aaa bbb ccc

    # 转义符
    s = "a\nb\tc"
    print(s)  # a
    # b c

    print(len(s))  # 5

    # 索引切片遍历
    name = "jason"
    print(name[0])  # j
    print(name[1:3])  # as
    for char in name:
        print(char)  # j a s o n

    # 改变字符串
    s = "hello"
    s = 'H' + s[1:]
    print(s)  # Hello
    s = s.replace('H', 'h')
    print(s)  # hello

    # 字符串拼接，时间复杂度O(N)
    # s = ''
    # for n in range(0, 100000):
    # 	s += str(n)
    # print(s)

    # join函数 时间复杂度O(N)
    # l = []
    # for n in range(0, 100000):
    # 	l.append(str(n))
    # l = ' '.join(l)
    # print(l)

    # split分割数据
    path = "hive://ads/training_table"
    print(path.split('//'))  # ['hive:', 'ads/training_table']
    namespace = path.split('//')[1].split('/')[0]
    table = path.split('//')[1].split('/')[1]
    print(namespace, table)  # ads training_table

    # strip函数
    s = " my name is jason "
    print(s.strip())  # my name is jason 去掉首尾空格
    print(s)  # my name is jason
    print(len(s.strip()))  # 16
    print(len(s))  # 18

    # 字符串格式化函数
    print("我的名字叫{},年龄{}".format("zym", str(35)))  # 我的名字叫zym,年龄35
