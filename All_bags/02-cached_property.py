# Using @property

# A sample class
# class Sample:
#
#     def __init__(self):
#         self.result = 50
#
#     @property
#     # a method to increase the value of
#     # result by 50
#     def increase(self):
#         self.result = self.result + 50
#         return self.result
#
#     # obj is an instance of the class sample
#
#
# obj = Sample()
# print(obj.increase)
# print(obj.increase)
# print(obj.increase)

# 100
# 150
# 200

# Using @cached_property

from cached_property import cached_property


# A sample class
class Sample():

    def __init__(self):
        self.result = 50

    @cached_property
    # a method to increase the value of
    # result by 50
    def increase(self):
        self.result = self.result + 50
        return self.result

    # obj is an instance of the class sample


obj = Sample()
print(obj.increase)
print(obj.increase)
print(obj.increase)

# 100
# 100
# 100