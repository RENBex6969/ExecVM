return (function(Roblox)
  local setProperty = function(PropertyName, Value)
    Roblox.implementProperty("HttpService", PropertyName, function()
      return Value
    end, function() 
      error("Cannot modify")
    end)
  end

  setProperty("HttpEnabled", true)
  setProperty("HttpProxyEnabled", false)
end)
