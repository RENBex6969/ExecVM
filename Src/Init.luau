local Registry = require("@Modules/Registry")
local Utility = require("@Modules/Utility")

local Game, Roblox = require("@Src/Game/Compiled")()

local Exploit = require("@Src/Exploit/Compiled")
local Luau = require("@Src/Luau/Compiled")
local Sandbox = {}

function Sandbox:Create()
  local Globals = {}
  local CompiledRoblox = {
    game = Game
  }
  
  for Name, Value in next, Roblox do
    if type(Value) == "table" then
      CompiledRoblox[Name] = Value
    end
  end
  
  Exploit.getgenv = function()
    return Utility:DeepMerge(Exploit, Globals)
  end
  
  return setmetatable(Exploit, {
    __index = function(_, Key)
      local Value = Luau[Key]
      if Value then
        return Value
      end
      
      local Value = CompiledRoblox[Key]
      if Value then
        return Value
      end
      
      
      local Value = Globals[Key]
      if Value then
        return Value
      end
      
      return print("Missing", Key)
    end,
    __newindex = function(_, Index, Value)
      Globals[Index] = Value
    end
  })
end

return Sandbox