local cloneref = cloneref or function(x) return x end

local MarketplaceService = cloneref(game:GetService("MarketplaceService"))

local Compkiller = loadstring(game:HttpGet("https://raw.githubusercontent.com/4lpaca-pin/CompKiller/refs/heads/main/src/source.luau"))()

Compkiller.Colors.Highlight = Color3.fromRGB(255, 0, 0)
Compkiller.Colors.Toggle = Color3.fromRGB(255, 0, 0)
Compkiller.Colors.DropColor = Color3.fromRGB(45, 45, 45)
Compkiller.RefreshCurrentColor()
Compkiller.AlwayShowTab = true

local Notifier = Compkiller.newNotify()

local GAMES = {
    ["Flick"] = {id = 8795154789, script = "https://raw.githubusercontent.com/Cobru1/Arqel/refs/heads/main/Flick.luau"},
    ["Rob It"] = {id = 9472441390, script = "https://raw.githubusercontent.com/Cobruhehe/Arqel/refs/heads/main/Rob%20it.luau"},
    ["Kiosk"] = {id = 8539298853, script = "https://raw.githubusercontent.com/Cobru1/Arqel/refs/heads/main/Kiosk.luau"},
    ["Build a Bunker"] = {id = 7738927312, script = "https://raw.githubusercontent.com/Cobru1/Arqel/refs/heads/main/Build%20a%20bunker.luau"},
    ["Forge"] = {id = 7671049560, script = "https://raw.githubusercontent.com/Nappypie/Happy/refs/heads/main/obfuscated_script-1766713626679.lua.txt"},
    ["Lootify"] = {id = 5682590751, script = "https://raw.githubusercontent.com/Cobru1/Arqel/refs/heads/main/Lootify.luau"},
    ["Be a Lucky Block"] = {id = 9787206684, script = "https://raw.githubusercontent.com/Cobruhehe/Arqel/refs/heads/main/bealuckyblock.luau"},
}

local match = nil
for name, config in pairs(GAMES) do
    if config.id == game.GameId then
        match = {name = name, script = config.script}
        break
    end
end

if match then
    Notifier.new({Title = "Supported Game", Content = match.name .. " Script Loading...", Duration = 3, Icon = "rbxassetid://95721401302279"})
    local ok, err = pcall(function() loadstring(game:HttpGet(match.script))() end)
    if not ok then
        Notifier.new({Title = "Load Error", Content = tostring(err), Duration = 5, Icon = "rbxassetid://95721401302279"})
    end
else
    local gameName = "Unknown"
    pcall(function() gameName = MarketplaceService:GetProductInfo(game.PlaceId).Name end)
    Notifier.new({Title = "Unsupported Game", Content = gameName .. " not supported", Duration = 3, Icon = "rbxassetid://95721401302279"})
end
