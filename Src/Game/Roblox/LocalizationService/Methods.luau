return (function(Roblox)
  local CreateTranslator = function()
    local Translator = newproxy(true)
    local MT = getmetatable(Translator)
    local Obj = {}
    
    function Obj:Translate(...)
      return ""
    end
    
    function Obj:FormatByKey(...)
      return ""
    end
    
    Obj.LocaleId = "en_us"
    
    MT.__index = function(_, Index)
      return Obj[Index]
    end
    return Translator
  end
  
  Roblox.implementMethod("LocalizationService", "GetCorescriptLocalizations", function(_, ...)
    return {
      {
        Key = "Hello World",
        Source = "Hello World",
        Values = {
          en_us = "Hello World",
          es_es = "Hola Mundo",
        }
      }
    }
  end)

  Roblox.implementMethod("LocalizationService", "GetCountryRegionForPlayerAsync", function(_, Player)
    return "US"
  end)
  
  Roblox.implementMethod("LocalizationService", "GetTableEntries", function(_, ...)
    return {
      {
        Key = "Hello World",
        Source = "Hello World",
        Values = {
          en_us = "Hello World",
          es_es = "Hola Mundo",
        }
      }
    }
  end)
  
  Roblox.implementMethod("LocalizationService", "GetTranslatorForLocaleAsync", function(_, ...)
    return CreateTranslator()
  end)

  Roblox.implementMethod("LocalizationService", "GetTranslatorForPlayer", function(_, ...)
    return CreateTranslator()
  end)
  
  Roblox.implementMethod("LocalizationService", "GetTranslatorForPlayerAsync", function(_, ...)
    return CreateTranslator()
  end)
end)