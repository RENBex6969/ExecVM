return (function()
  local Network = require("@Modules/Network")
  local Utility = require("@Modules/Utility")
  local Registry = require("@Modules/Registry")
  local Roblox = require("@lune/roblox")
  local Create = Roblox.Instance.new
  local Game = Create("DataModel")
  Registry.Roblox = Roblox
  Registry.Game = Game
  Game.PlaceId = 0
  
  local ImplementService = function(Name)
    Roblox.implementProperty("DataModel", Name, function()
      return Game:GetService(Name)
    end, function() end)
  end
  
  local GameMethods = require("./Roblox/Game/Methods")(Roblox, Network)
  local GameProperties = require("./Roblox/Game/Properties")(Roblox)
  
  ImplementService("HttpService")
  local HttpMethods = require("./Roblox/HttpService/Methods")(Roblox, Network)
  local HttpProperties = require("./Roblox/HttpService/Properties")(Roblox)
  
  ImplementService("Players")
  
  
  ImplementService("Lighting")
  
  
  ImplementService("ReplicatedStorage")
  
  
  ImplementService("ServerStorage")
  
  
  ImplementService("ServerScriptService")
  
  
  ImplementService("StarterGui")
  ImplementService("StarterPack")
  ImplementService("StarterPlayer")
  ImplementService("CoreGui")
  ImplementService("Workspace")
  ImplementService("Teams")
  
  ImplementService("GuiService")
  
  ImplementService("UserInputService")
  
  ImplementService("RunService")
  
  ImplementService("HapticService")
  
  ImplementService("VRService")
  
  ImplementService("PathfindingService")
  
  ImplementService("PhysicsService")
  
  ImplementService("CollectionService")
  
  ImplementService("SoundService")
  local SoundMethods = require("./Roblox/SoundService/Methods")(Roblox)
  local SoundProperties = require("./Roblox/SoundService/Properties")(Roblox)

  ImplementService("TextService")
  local TextMethods = require("./Roblox/TextService/Methods")(Roblox)
  local TextProperties = require("./Roblox/TextService/Properties")(Roblox)

  ImplementService("TweenService")
  
  ImplementService("TeleportService")
  
  ImplementService("MarketplaceService")
  
  ImplementService("Chat")
  
  ImplementService("DataStoreService")
  
  ImplementService("ContextActionService")
  
  
  ImplementService("PolicyService")
  local PolicyMethods = require("./Roblox/PolicyService/Methods")(Roblox)
  local PolicyProperties = require("./Roblox/PolicyService/Properties")(Roblox)
  
  ImplementService("BadgeService")
  
  ImplementService("LocalizationService")
  local LocalizationMethods = require("./Roblox/LocalizationService/Methods")(Roblox)
  local LocalizationProperties = require("./Roblox/LocalizationService/Properties")(Roblox)
  
  ImplementService("AnalyticsService")
  
  ImplementService("RbxAnalyticsService")
  local RbxAnalyticsMethods = require("./Roblox/RbxAnalyticsService/Methods")(Roblox)
  local RbxAnalyticsProperties = require("./Roblox/RbxAnalyticsService/Properties")(Roblox)
  
  ImplementService("Debris")
  local DebrisMethods = require("./Roblox/DebrisService/Methods")(Roblox)
  local DebrisProperties = require("./Roblox/DebrisService/Properties")(Roblox)
  
  ImplementService("MessagingService")

  ImplementService("AdService")
  ImplementService("AssetService")
  ImplementService("InsertService")
  ImplementService("KeyframeSequenceProvider")
  ImplementService("ScriptContext")
  ImplementService("Selection")
  ImplementService("SocialService")
  ImplementService("StudioService")
  ImplementService("TestService")
  ImplementService("ThumbnailGenerator")
  
  
  
  return Game, Roblox
end)