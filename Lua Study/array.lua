Arr={1,2,3,test="value",4,5}

-- for index, value in ipairs(Arr) do
--     print(index,value)
-- end

for i = 1, 100 do
    table.insert(Arr,1,i)
end

print(#Arr)