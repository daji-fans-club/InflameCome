print("************面向对象************")
print("************封装************")
--面向对象 类 其实都是基于 table来实现
--元表相关的知识点
Object = {
    id=1
}
function Object:new()
    self.__index=self
    return setmetatable({},self)
end
local myObj=Object:new()
print(myObj.id)
print("************继承************")
--写一个用于继承的方法
function Object:subClass(className)
    --_G知识点 是总表 所有声明的全局变量以键值对形式存在
    _G[className]={}
    local obj=_G[className]
    self.__index=self
    setmetatable(obj,self)
end
print(_G)
_G["a"]=1
print(a)

Object:subClass("Person")
print(Person)
print(Person.id)
local p1=Person:new()
print(p1.id)
print("************多态************")
--相同行为 不同表象 就是多态
--相同方法 不同执行逻辑 就是多态
Object:subClass("GameObject")
GameObject.posX=0;
GameObject.posY=0;
function GameObject:Move()
    self.posX=self.posX+1
    self.posY=self.posY+1
    print(self.posX..","..self.posY)
end
GameObject:subClass("Player")
p1=Player:new()
p1:Move()