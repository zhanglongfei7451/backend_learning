from attr import attrs, attrib


#  安装的时候安装了attrs和cattrs两个库，实际导入的时候使用的是attr和cattr两个包，不带s

class Color(object):
    def __init__(self, r, g, b):
        self.r = r
        self.g = g
        self.b = b

    #  某个对象本身打印结果
    def __repr__(self):
        return f'{self.__class__.__name__}(r={self.r}, g={self.g}, b={self.b})'

    #  定义比较符对两个对象进行比较
    def __lt__(self, other):
        if not isinstance(other, self.__class__): return NotImplemented
        return (self.r, self.g, self.b) < (other.r, other.g, other.b)


# color = Color(255, 255, 255)
# print(color)  # Color(255, 255, 255)


@attrs
class Test(object):
    r = attrib(type=int, default=0)
    b = attrib(type=int, default=0)
    g = attrib(type=int, default=0)


color_1 = Test(255, 255, 255)
print(color_1)  # Test(r=255, b=255, g=255)

# 实际上，主要是 attrs 这个修饰符起了作用，然后根据定义的 attrib 属性自动
# 帮我们实现了__init__、__repr__、__eq__、__ne__、__lt__、__le__、__gt__、__ge__、__hash__这几个方法


@attrs(frozen=True)
class ColorCp(object):
    r = attrib()
    g = attrib()

# frozen=True创造在实例化后不可变的类，下面就会报错
# i = ColorCp(200, 300)
# i.r = 400

#  相当于实现了这么多的方法
class RoughClass(object):
    def __init__(self, a, b):
        self.a = a
        self.b = b

    def __repr__(self):
        return "RoughClass(a={}, b={})".format(self.a, self.b)

    def __eq__(self, other):
        if other.__class__ is self.__class__:
            return (self.a, self.b) == (other.a, other.b)
        else:
            return NotImplemented

    def __ne__(self, other):
        result = self.__eq__(other)
        if result is NotImplemented:
            return NotImplemented
        else:
            return not result

    def __lt__(self, other):
        if other.__class__ is self.__class__:
            return (self.a, self.b) < (other.a, other.b)
        else:
            return NotImplemented

    def __le__(self, other):
        if other.__class__ is self.__class__:
            return (self.a, self.b) <= (other.a, other.b)
        else:
            return NotImplemented

    def __gt__(self, other):
        if other.__class__ is self.__class__:
            return (self.a, self.b) > (other.a, other.b)
        else:
            return NotImplemented

    def __ge__(self, other):
        if other.__class__ is self.__class__:
            return (self.a, self.b) >= (other.a, other.b)
        else:
            return NotImplemented

    def __hash__(self):
        return hash((self.__class__, self.a, self.b))


# attrs可以用 s或 attributes来代替，attrib 可以用 attr或 ib来代替


# 输出出来了，可以看到结果是一个元组，元组每一个元素都其实是一个 Attribute对象，包含了各个参数，下面详细解释下几个参数的含义：
#
# name：属性的名字，是一个字符串类型。
# default：属性的默认值，如果没有传入初始化数据，那么就会使用默认值。如果没有默认值定义，那么就是 NOTHING，即没有默认值。
# validator：验证器，检查传入的参数是否合法。
# init：是否参与初始化，如果为 False，那么这个参数不能当做类的初始化参数，默认是 True。
# `metadata：元数据，只读性的附加数据。
# type：类型，比如 int、str 等各种类型，默认为 None。
# converter：转换器，进行一些值的处理和转换器，增加容错性。
# kw_only：是否为强制关键字参数，默认为 False。