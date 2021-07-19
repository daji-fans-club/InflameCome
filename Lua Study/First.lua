print("hello,lua")

-- local 定义局部变量
local num = 100
print(num)

local function max(a,b)
    if a>b then
        return a
    else
        return b
    end
    
end

print(max(math.random(),math.random()))

--    初始值  终值 间隔
for i = 1, 10, 2 do
    print(i)
end