Config={hello="Hello lua",world="World"}
Config.words="Hello"
Config.num=100
Config["name"]="test"

print(Config.words)
print(Config.name)

for key, value in pairs(Config) do
    print(key,value)
end