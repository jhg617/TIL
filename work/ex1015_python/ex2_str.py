str = 'go for it!'
print("str=%s" %str)

print("str={}".format(str))

test = str*3
print("test:{}".format(test))

v1 = str[3]
print("str[3]:%s" %v1)

v2 = str[2:5]
print("str[2:5]:%s" %v2)

idx = str.find("it")
print("str.find(\"it\"):{}".format(idx))