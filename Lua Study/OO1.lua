-- 通过表的方式实现
-- 面向对象

local function clone(tab)
    local ins={}
    for key, value in pairs(tab) do
        ins[key]=value
    end
    return ins
end

local function copy(dist,tab)
    for key, value in pairs(tab) do
        dist[key]=value
    end
end

People={}

People.sayHi=function (self)
    print(self.name.."YOU KNOW THE RULES ,SO DO I")
end

People.new=function (name)
    local self = clone(People)
    self.name=name
    return self
end

local p = People.new("Rick")
-- 两种写法等价 以后用下面那种 很类似python self自动加入参数
p.sayHi(p)
p:sayHi()

-- 继承
--  People.new(name) 相当于Python中调用父类的构造方法 super.xxx(yy)
Man={}
Man.new=function (name)
    local self = People.new(name)
    copy(self,Man)
    return self
end

Man.sayHello=function (self)
    print(self.name.."NEVER GONNA GIVE YOU UP")
end

-- 方法重写
Man.sayHi=function (self)
    print(self.name.."NEVER GONNA LET YOU DOWN")
end

local m=Man.new("Astley")
m:sayHi()
m:sayHello()