# coding:utf-8
# 第七课 修炼基本功 条件与循环


if __name__ == "__main__":
	# 条件语句
	x = -3
	if x < 0:
		y = -x
	else:
		y = x
	print(y)  # 3
	
	# elif语句
	id = 2
	if id == 0:
		print("red")
	elif id == 1:
		print("yellow")
	else:
		print("green")  # green
		
	# 循环
	l = [1, 2, 3, 4]
	for item in l:
		print(item)  # 1 2 3 4
		
	# 字典循环
	d = {
		"name":"jason",
		"dob":"2000-01-01",
		"gender":"male"
	}
	for k in d:
		print(k)  # name dob gender
		
	for v in d.values():
		print(v)  # jason 2000-01-01 male
		
	for k, v in d.items():
		print("keys:{}, values:{}".format(k, v))
		# keys: name, values: jason
		# keys: dob, values: 2000 - 01 - 01
		# keys: gender, values: male
		
	# 用索引来循环
	l = [1,2,3,4,5,6,7]
	for index in range(0, len(l)):
		if index < 5:
			print(l[index])  # 1 2 3 4 5
			
	# 用索引和元素来循环
	l = [1,2,3,4,5,6,7]
	for index, item in enumerate(l):
		if index < 5:
			print(item)  # 1 2 3 4 5
			
	# break和continue
	name_price = {"一":100, "二":10, "三":10000}
	name_color = {"一":"红",  "二":"蓝", "三":"红"}
	# 不用continue
	for name, price in name_price.items():
		if price < 1000:
			if name in name_color:
				for color in name_color[name]:
					if color != "红":
						print("name:{}, color:{}".format(name, color))  # name:二, color:蓝
			else:
				print("name:{}, color:{}".format(name, None))  # name:一, color:红
	# 用continue
	for name, price in name_price.items():
		if price >= 1000:
			continue
		if name not in name_color:
			print("name:{}, color:{}".format(name, None))
			continue
		for color in name_color[name]:
			if color == "red":
				continue
			print("name:{}, color:{}".format(name, color))
			
	# while循环
	l = [1,2,3,4]
	index = 0
	while index < len(l):
		print(l[index])  # 1 2 3 4
		index += 1
		
	# 测试for和while的效率
	import time
	start_for = time.perf_counter()
	for i in range(0, 1000000):
		pass
	end_for = time.perf_counter()
	print("for循环{}秒".format(end_for-start_for))  # for循环0.031629500000000005秒
	start_while = time.perf_counter()
	i = 0
	while i < 1000000:
		i += 1
	end_while = time.perf_counter()
	print("while循环{}秒".format(end_while-start_while))  # while循环0.07765040000000001秒
	
	# 思考题
	attributes = ['name', 'dob', 'gender']
	values = [
					['jason', '2000-01-01', 'male'], 
					['mike', '1999-01-01', 'male'],
					['nancy', '2001-02-01', 'female']
					]
	# 多行循环语句
	result = []
	for index in range(0, len(values)):
		temp = {}
		for j in range(3):
			temp[attributes[j]]=values[index][j]
		result.append(temp)
	print(result)
	# [{'name': 'jason', 'dob': '2000-01-01', 'gender': 'male'}, {'name': 'mike', 'dob': '1999-01-01', 'gender': 'male'}, {'name': 'nancy', 'dob': '2001-02-01', 'gender': 'female'}]
	# 一行条件循环语句 抄同学的
	result = [dict(zip(attributes,v)) for v in values]
	print(result)

	