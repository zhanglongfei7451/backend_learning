class DEMO:
    def __init__(self, name, age):
        self.name = name
        self.age = age
        print(self.__class__)
        print(self.__class__.__name__)


zhang = DEMO('zz', 18)
