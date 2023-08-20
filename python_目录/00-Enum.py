# class ColorCode:
#     RED = 1
#     BLUE = 2
#     WHITE = 3
#
#
# def print_color(code):
#     if code == ColorCode.RED:
#         print('red')
#     elif code == ColorCode.WHITE:
#         print('white')
#     elif code == ColorCode.BLUE:
#         print('BLUE')
#
#
# print_color(3)

#  缺点:类属性可以随意修改,枚举类型要求一旦完成定义，就不能再修改，否则使用枚举的地方将由于枚举值的改变出现不可知的问题。
import enum
from enum import unique


@unique
class ColorCode(enum.Enum):
    RED = 1
    BLUE = 2
    WHITE = 3


def print_color(code):
    if code == ColorCode.RED.value:
        print('red')
    elif code == ColorCode.WHITE.value:
        print('white')
    elif code == ColorCode.BLUE.value:
        print('BLUE')


print_color(3)

for color in ColorCode:
    print(color.name, color.value)
#  修改属性将报错
#  枚举值不能被修改，是使用枚举类型进行编程的最重要的目的之一，
#  假设枚举值可以被修改，那么也就没有必要提供enum这个模块了，
#  我们使用自定义类和类属性就能够替代enum模块
#  ColorCode.RED = 40

#  枚举值理论上是允许重复的，如果不希望出现枚举值重复的情况，可以使用enum模块提供的unique装饰器


#  枚举值比较
#  枚举值  print(ColorCode.RED.value == 1)       # True
