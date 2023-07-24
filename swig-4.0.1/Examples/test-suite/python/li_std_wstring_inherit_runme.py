import li_std_wstring_inherit
import sys

x = u"hello"

s = li_std_wstring_inherit.wstring(u"he")
s = s + u"llo"

if s != x:
    print s, x
    raise RuntimeError("bad string mapping")

if s[1:4] != x[1:4]:
    raise RuntimeError("bad string mapping")

a = li_std_wstring_inherit.A(s)
b = li_std_wstring_inherit.wstring(" world")

if a + b != "hello world":
    raise RuntimeError("bad string mapping")

if a + " world" != "hello world":
    raise RuntimeError("bad string mapping")

# This is expected to fail if -builtin is used
# Reverse operators not supported in builtin types
if not li_std_wstring_inherit.is_python_builtin():
    if "hello" + b != "hello world":
        raise RuntimeError("bad string mapping")

    c = "hello" + b
    if c.find_last_of("l") != 9:
        raise RuntimeError("bad string mapping")

b = li_std_wstring_inherit.B("hi")

b.name = li_std_wstring_inherit.wstring(u"hello")
if b.name != "hello":
    raise RuntimeError("bad string mapping")


b.a = li_std_wstring_inherit.A("hello")
if b.a != u"hello":
    raise RuntimeError("bad string mapping")

