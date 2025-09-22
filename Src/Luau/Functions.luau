local Task = require("@lune/task")

return {
  print = function(...)
    return print("[PRINT]:", ...)
  end,
  warn = function(...)
    return print("[WARN]:", ...)
  end,
  error = function(Message, Stack)
    return error(Message, (Stack or 0)+ 2)
  end,
  pcall = function(Func, ...)
    local Results = {pcall(Func, ...)}
    local Error = Results[2]
    if not Results[1] and type(Error) == "string" and string.find(Error, "attempt to perform arithmetic") then
      local Line = Error:sub(1, Error:find(":(%d*):")) .. "1:"
      local Metatable; Metatable = setmetatable({
        gsub = function()
          return Metatable
        end
      },{
        __eq = function()
          return true
        end, 
        __tostring = function()
          return Line .. " attempt to perform arithmetic (pow) on string and number"
        end
      })
      print("[VM - System ]: Bypassing (Prometheus / Forks) line check")
      return false, Metatable
    end
    if Results[1] == false then
      pcall(function()
        Results[2] = Results[2]:gsub(":%d+:",":1:")
      end)
    end
    local Succ, Err = table.unpack(Results)
    if type(err) == "userdata" then
      Err = tostring(Err)
    end
    return table.unpack(Results)
  end,
  xpcall = function(...)
    return xpcall(...)
  end,
  tonumber = function(...)
    return tonumber(...)
  end,
  tostring = function(...)
    return tostring(...)
  end,
  assert = function(Condition, Message, ...)
    return assert(Condition, Message, ...)
  end,
  pairs = function(...)
    return pairs(...)
  end,
  ipairs = function(...)
    return ipairs(...)
  end,
  select = function(...)
    return select(...)
  end,
  newproxy = function(HasMT)
    return newproxy(HasMT)
  end,
  unpack = function(...)
    return table.unpack(...)
  end,
  next = function(...)
    return next(...)
  end,
  type = function(...)
    return type(...)
  end,
  typeof = function(Object)
    return typeof(Object)
  end,
  rawset = function(Table, Index)
    return rawset(Table, Index)
  end,
  rawget = function(Table, Index)
    return rawget(Table, Index)
  end,
  rawequal = function(Left, Right)
    return rawequal(Left, Right)
  end,
  rawlen = function(Value)
    return rawlen(Value)
  end,
  setmetatable = function(Table, MT)
    return setmetatable(Table, MT)
  end,
  getmetatable = function(...)
    return getmetatable(...)
  end,
  wait = function(...)
    return Task.wait(...)
  end,
  tick = function(...)
    return os.time() + (os.clock() % 1)
  end,
  delay = function(Seconds, Func)
    return Task.delay(Seconds, Func)
  end,
  require = function(Module)
    
  end
}