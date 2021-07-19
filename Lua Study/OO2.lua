-- 通过闭包实现
-- 面向对象


-- 闭包实现真正的私有
-- function People(name)
--     local self={}

--     local function init()
--         self.name=name
--     end

--     self.sayHi=function ()
--         print(self.name.."NEVER GONNA TURN AROUND")
--     end

--     init()
--     return self
-- end

-- local p=People("Rick")
-- p:sayHi()

-- -- 继承

-- function Man(name)
--     local self =People(name)

--     local function init()
        
--     end

--     self.sayHi=function ()
--         print(self.name.."AND DESERT YOU ")
--     end

--     self.sayHello=function ()
--         print(self.name.."NEVER GONNA SAY GOODBYE")
--     end


--     return self
-- end

-- local m=Man("Astley")
-- m:sayHi()
-- m:sayHello()

-- Tab1 = { key1 = "val1", key2 = "val2", "val3" }
-- for k, v in pairs(Tab1) do
--     print(k .. " - " .. v)
-- end
 
-- Tab1.key1 = nil
-- for k, v in pairs(Tab1) do
--     print(k .. " - " .. v)
-- end


function Animal(name)
    local self={}
    local function init()
        self.name=name
    end

    self.eat= function()
        print(self.name.."eat")
    end

    self.drink= function()
        print(self.name.."eat")
    end
    init()

    return self
end

local oneBird=Animal("bird")
oneBird.eat()
oneBird.drink()

function Cat(name)
    local self=Animal(name)
    local function init()
        
    end
    -- 尝试重写
    self.eat=function ()
        print(self.name.." eat fish")
    end

    self.drink=function ()
        print(self.name.." drink water")
    end

    self.catch=function ()
        print(self.name.." catch mouse")
    end

    return self
end

Tom=Cat("Tom")
Tom:catch()
Tom:eat()
Tom:drink()