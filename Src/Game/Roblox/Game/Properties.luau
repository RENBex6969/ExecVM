
return (function(Roblox)
  local Registry = require("@Modules/Registry")
  local setGameProperty = function(PropertyName, Value)
    Roblox.implementProperty("DataModel", PropertyName, function()
      return Value
    end, function() 
      error("Cannot modify the game")
    end)
  end
  
  Roblox.implementProperty("DataModel", "Loaded", table.unpack({
    function()
      return {
        Wait = function()
          return
        end,
        Connect = function(_, Callback)
          Callback()
          return { Disconnect = function() end }
        end
      }
    end, 
    function() end
  }))

--[[
  setGameProperty("Archivable", true)
  setGameProperty("ClassName", "DataModel")
  setGameProperty("Name", Registry.Game.Name)
  setGameProperty("CreatorId", 0)
  setGameProperty("CreatorType", nil)
  setGameProperty("Genre", nil) -- Enum.Genre
  setGameProperty("MatchmakingType", nil) -- Enum.MatchmakingType
  setGameProperty("GameId", Registry.Game.ID)
  setGameProperty("PlaceId", Registry.Game.PlaceID)
  setGameProperty("UniverseId", Registry.Game.UniverseID)
  setGameProperty("PlaceVersion", Registry.Game.PlaceVersion)
  setGameProperty("PrivateServerId", "VIRTUAL")
  setGameProperty("PrivateServerOwnerId", Registry.Game.PrivateServerOwnerId)
  setGameProperty("JobId", Registry.Game.JobID)
  setGameProperty("CurrentCamera", nil)
  setGameProperty("ReplicationFocus", nil)
  ]]
end)