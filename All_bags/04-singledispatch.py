from functools import singledispatch


@singledispatch
def fun(arg, verbose=False):
    if verbose:
        print("Let me just sqy, ", end=" ")
    print(arg)






@fun.register
def _(arg: int, verbose=False):
    if verbose:
        print("Strength in numbers, eh?", end=" ")
    print(arg)


@fun.register
def _(arg: list, verbose=False):
    if verbose:
        print("Enumerate this:")
    for k, v in enumerate(arg):
        print(k, v)


@fun.register(int)
def _(arg, verbose=False):
    if verbose:
        print("Strength in numbers, eh?", end=" ")
    print(arg)


@fun.register(list)
def _(arg, verbose=False):
    if verbose:
        print("Enumerate this:")
    for k, v in enumerate(arg):
        print(k, v)


if __name__ == '__main__':
    fun(1, verbose=True)
    fun([1, 2, 4], verbose=True)
    fun(1.01, verbose=True)
