local Utility = require("@Modules/Utility")
local Bit = require("@Modules/Bit")
local Task = require("@lune/task")

return {
  string = Utility:DeepClone(string),
  math = Utility:DeepClone(math),
  table = Utility:DeepClone(table),
  os = Utility:DeepClone(os),
  coroutine = Utility:DeepClone(os),
  task = Utility:DeepClone(Task),
  utf8 = Utility:DeepClone(utf8),
  bit = Utility:DeepClone(Bit),
  bit32 = Utility:DeepClone(bit32),
}