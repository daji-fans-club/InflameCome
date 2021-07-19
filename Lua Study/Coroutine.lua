print("************协同程序************")

print("************协程的创建************")
--常用
--coroutine.create()
local corFun=function ()
    print(123)
end

local co=coroutine.create(corFun)
--协程的本质是一个线程对象
print(co)
print(type(co))

--
--coroutine.wrap
local co2=coroutine.wrap(corFun)
print(co2)
print(type(co2))


print("************协程的运行************")
--coroutine.resume
coroutine.resume(co)

co2()
print("************协程的挂起************")
--coroutine.yield(...)可以有返回值 默认第一个返回值是boolean,是否重启成功 新加的返回值不会覆盖
local corFun2=function ()
    local temp=1
    -- while true do
    --     print("死循环执行"..temp)
    --     --协程的挂起函数
    --     temp=temp+1
    --     coroutine.yield()
    -- end
    print(temp)
    temp=temp+1
    coroutine.yield(temp)
    print(temp)
    temp=temp+1
    coroutine.yield(temp)
    print(temp)
    temp=temp+1
    coroutine.yield(temp)
    print(temp)
    temp=temp+1
    coroutine.yield(temp)
end

local co3=coroutine.create(corFun2)
--yield 4次 resume 5次 第五次不会再重头开始执行
local isOk,ttemp=coroutine.resume(co3)
print(isOk,ttemp)
local isOk, ttemp=coroutine.resume(co3)
print(isOk,ttemp)
local isOk, ttemp=coroutine.resume(co3)
print(isOk,ttemp)
local isOk, ttemp=coroutine.resume(co3)
print(isOk,ttemp)
local isOk, ttemp=coroutine.resume(co3)
print(isOk,ttemp)

local co4=coroutine.wrap(corFun2)
--wrap方式没有默认的返回值,会直接返回yield中的返回值
print("返回值"..co4())
print("返回值"..co4())
print("返回值"..co4())
print("返回值"..co4())

print("************协程的状态************")
--coroutine.status(协程对象)
--dead 结束
--suspended 暂停
--running 进行中
local corFun3=function ()
    print(1)
    --要在协程函数内获得协程状态 running 该协程的定义要在函数的作用域,要能被识别 所以这里co5不能加local
    print(coroutine.status(co5))
    coroutine.yield()
    print(2)
    coroutine.yield()
    print(3)
    coroutine.yield()
    print(4)
end

co5=coroutine.create(corFun3)
print(coroutine.status(co5))
coroutine.resume(co5)
print(coroutine.status(co5))
coroutine.resume(co5)
print(coroutine.status(co5))
coroutine.resume(co5)
print(coroutine.status(co5))
coroutine.resume(co5)
print(coroutine.status(co5))

--获得正在执行的协程的协程号
--coroutine.status()该方法值只能输入协程参数 所以wrap协程无法使用
print(coroutine.status(co),coroutine.status(co3),coroutine.status(co5))
print("正在执行的协程")
print(coroutine.running())

print(coroutine.isyieldable(co))
print(coroutine.isyieldable(co3))
print(coroutine.isyieldable(co5))