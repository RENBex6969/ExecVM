local Utility = require("@Modules/Utility")
local Functions = require("@Src/Luau/Functions")
local Libraries = require("@Src/Luau/Libraries")

return Utility:DeepMerge(Functions, Libraries)