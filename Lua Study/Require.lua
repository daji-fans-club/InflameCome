print("************多脚本执行************")
local testX="testX"
print("************全局变量本地变量************")
--关键字require("脚本名") 
print(package.loaded["MultiTest"])
require("MultiTest")
print(TestG)
print("************脚本卸载************")
--require加载执行的脚本，加载一次后再require也不会再执行
require("MultiTest")
--package.loaded["脚本名"]  可获取指定脚本是否执行过 如果未执行，返回的不是false 而是nil
print(package.loaded["MultiTest"])
package.loaded["MultiTest"]=nil --赋值nil，就是卸载脚本
require("MultiTest")

local testY=require("MultiTest")
print("testY"..testY)
print("************大G表************")

--_G表是一个总表(table) 他将我们声明的所有全局的变量都存储在其中 包括require中的全局变量
-- for k, v in pairs(_G) do
--     print(k,v)
-- end
--本地变量 加了local的变量 是不会存到大_G表中的