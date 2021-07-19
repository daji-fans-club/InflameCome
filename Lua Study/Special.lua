print("************特殊用法************")
print("************多变量赋值************")
local a,b,c=1,2,3
print(a)
print(b)
print(c)
--不够补nil
local a,b,c=1,2
print(a)
print(b)
print(c) --nil
--多了忽略
local a,b,c=1,2,3,4
print(a)
print(b)
print(c) --nil

print("************多返回值************")

function Test()
    return 10,20
end
--同理 多返回值 少了补nil 多了忽略
a,b,c=Test()
print(a)
print(b)
print(c)

print("************and or************")
--逻辑 与 或
--但不仅可以连接boolean类型 任何都可以连接
--在lua中 只有nil和false被认为是假 0也是true

--1 and 2后,因为1为真 所以2被执行 然后会返回2 所以打印2
print(1 and 2)

print(false and 1)

print(false or 1)

--利用and 和 or 的特性 模拟三目运算符

print((true and 1) or false)
local function outBool(param)
    if param==0 then
        return false
    else
        return true
    end
end

print((outBool(0) and 1)or(not outBool(0) and 3))

local x=1
local y=2
local res=(x>y) and x or y
print(res)