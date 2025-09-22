return (function(Roblox)
  Roblox.implementMethod("PolicyService", "CanViewBrandProjectAsync", function(_, Url, ...)
    return false
  end)
  
  Roblox.implementMethod("PolicyService", "GetPolicyInfoForPlayerAsync", function(_, Url, ...)
    return {
      ["EasterEgg"] = "SEP 18"
    }
  end)
end)