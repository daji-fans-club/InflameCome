print("************元表************")
print("************元表概念************")
--任何表变量都可以作为另一个表变量的元表
--任何表变量都可以有自己的元表
--当我们对表进行一些操作 会执行元表中的内容

print("************设置元表************")
local meta={}
local myTable={}
--设置元表函数 (字表,元表)
setmetatable(myTable,meta)

print("************特定操作************")
print("************特定操作-__tostring************")
local meta2={
    --__tostring(t) 传入的参数默认为子表 前提是知道子表是什么
    __tostring=function (t)
        return t.name.."元表meta2的__tostring方法被调用"
    end
}
local myTable2={
    name="张三"
}
--设置元表函数 (字表,元表)
setmetatable(myTable2,meta2)
print(myTable2)
print("************特定操作-__call************")
local meta3={
    --__tostring(t) 传入的参数默认为子表 前提是知道子表是什么
    __tostring=function (t)
        return t.name.."元表meta3的__tostring方法被调用"
    end,
    --当子表被当做函数来使用时,会默认调用__call中的内容 同样,第一个参数默认为子表,或者说正在使用元表的子表
    __call=function (t,param)
        print(param)
        print("元表meta3的__call方法被调用")
    end
}
local myTable3={
    name="张三"
}
setmetatable(myTable3,meta3)
myTable3("成为__call的参数")

print("************特定操作-运算符重载************")
local meta4={
    --__tostring(t) 传入的参数默认为子表 前提是知道子表是什么
    __tostring=function (t)
        return t.name.."元表meta3的__tostring方法被调用"
    end,
    --当子表被当做函数来使用时,会默认调用__call中的内容 同样,第一个参数默认为子表,或者说正在使用元表的子表
    __call=function (t,param)
        print(param)
        print("元表meta3的__call方法被调用")
    end,
    --相当于运算符重载 当子表使用+运算符,会调用此方法 其他运算同理 __sub,__mul,__div,__pow,__eq,__lt,__le,__concat".."拼接
    __add=function (t1,t2)
        return {age=t1.age+t2.age,__tostring=function (t)
            return t.age
        end}
    end
}
local myTable4={
    age=18
}
local myTableT={
    age=19
}
setmetatable(myTable4,meta4)
setmetatable(myTableT,meta4)
print(myTable4+myTableT)

print("************特定操作-__index和__newindex************")
--是newindex 不是 newIndex ！！！
local meta5Father={
    __index={age=123}
}
local meta5={
    -- age=1,
}
setmetatable(meta5,meta5Father)
--只能写到外部,没有更好的办法了吗?  内部无法指向自己
meta5.__index=meta5
local myTable5={__index={age=100}}
setmetatable(myTable5,meta5)

--index当子表中找不到某一个属性时调用
--会到元表中 __index指定的表去找索引
print(myTable5.age)

--__newIndex 当赋值时,如果赋值一个不存在的索引
--那么会把这个值赋值到newIndex所指的表中 不会修改自己

local meta6={}
meta6.__newindex={}
local myTable6={}
myTable6=setmetatable(myTable6,meta6)
myTable6.age=18
print(myTable6.age)
print(meta6.__newindex.age)
--使用rawget 会只找自己身上的索引 不会去元表找
print(rawget(myTable6,"age"))
rawset(myTable6,"age",20)
print(rawget(myTable6,"age"))
