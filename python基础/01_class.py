class DEMO:
    def __init__(self, name, age):
        self.name = name
        self.age = age
        print(self.__class__)
        print(self.__class__.__name__)

    def get_00(self):
        return self.name

    @property
    def get(self):
        return 3

    @staticmethod
    def get_1(text):
        return text

    @classmethod
    def get_2(cls, name, age):
        return cls(name, age)


zhang = DEMO('zz', 18)  # <class '__main__.DEMO'>  DEMO
print(zhang.get_00())  # zz
print(zhang.get)  # 3
print(zhang.get_1(33))  # 33
zhang.get_2('li si', 22)  # <class '__main__.DEMO'>  DEMO
