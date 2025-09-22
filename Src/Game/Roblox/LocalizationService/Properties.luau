return (function(Roblox)
  local setProperty = function(PropertyName, Value)
    Roblox.implementProperty("LocalizationService", PropertyName, function()
      return Value
    end, function() 
      error("Cannot modify")
    end)
  end

  setProperty("RobloxLocaleId", "en_us")
  setProperty("SystemLocaleId", "en_us")
end)
