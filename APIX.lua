getgenv().Setting = {
	["Auto Farm"] = false
}

if not getgenv().Setting then return warn("couldn't found setting") end 

local Players = game:GetService("Players").LocalPlayer
local HttpService = game:GetService('HttpService')

getgenv().Check_Setting = function(...)
    local FileName = (...)
    return isfile("SaveSetting\\" .. FileName .. ".json")
end 

getgenv().Get_Setting = function(...)
    local FileName = (...)
    if typeof(FileName) == "string" then 
        if not isfolder("SaveSetting") then 
            makefolder("SaveSetting")
        end 
        if not isfile("SaveSetting\\" .. FileName .. ".json") then 
            local Encode = HttpService:JSONEncode(getgenv().Setting)
            writefile("SaveSetting\\" .. FileName .. ".json", Encode)
        else 
            local Decode = HttpService:JSONDecode(readfile("SaveSetting\\" .. FileName .. ".json"))
            return Decode
        end 
    end
end

getgenv().Update_Setting = function(...)
    local FileName = (...)
    if typeof(FileName) == "string" then 
        if isfile("SaveSetting\\" .. FileName .. ".json") then 
            local Encode = HttpService:JSONEncode(getgenv().Setting)
           	writefile("SaveSetting\\" .. FileName .. ".json", Encode)  
        end 
    end 
end 

getgenv().JsonEncode = function(...)
    local Table = (...)
    if typeof(Table) == "table" then 
        local Encode = HttpService:JSONEncode(Table)
        return Encode
    end
end 

getgenv().JsonDecode = function(...)
    local Table = (...)
    local Decode = HttpService:JSONDecode(Table)
    return Decode
end 

getgenv()["MyName"] = tostring(Players.Name)
