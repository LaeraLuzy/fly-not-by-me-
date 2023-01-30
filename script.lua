-- Loadstring
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
-- Window
local Window = Library.CreateLib("SyctheHub", "Sentinel")

-- Jailbreak
-- Tab
local Jailbreak = Window:NewTab("Jailbreak")

-- Section
local JailbreakSection = Jailbreak:NewSection("Jailbreak")

-- Button
JailbreakSection:NewButton("Execute", "Executes The Jailbreak Script", function()
   loadstring(game:HttpGet(('https://raw.githubusercontent.com/xChaoticVoid/Jailbreak/main/Chaos.lua'), true))()
end)

-- Phantom Forces
-- Tab
local Phantom = Window:NewTab("Phantom Forces")

-- Section
local PhantomSection = Phantom:NewSection("Phantom")

-- Button
PhantomSection:NewButton("Silent Aim", "Executes The Silent Aim Script", function()
   loadstring(game:HttpGet("https://raw.githubusercontent.com/The3Bakers4565/Spicy-Bagel/main/Other/Phantom_Forces/Silent_Aim.lua"))()
end)

PhantomSection:NewButton("ESP", "Executes The ESP Script", function()
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/scripts/main/phantomforces1'),true))()
end)

-- Counter Blox
-- Tab
local Cb = Window:NewTab("Counter Blox")

-- Section
local CbSection = Cb:NewSection("Cb")

-- Button
CbSection:NewButton("Execute", "Executes The Counter Blox Script", function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/CounterBlox.lua', true))()
end)

-- Bedwars
-- Tab
local Bw = Window:NewTab("Bed Wars")

-- Section
local BwSection = Bw:NewSection("Bw")

-- Button
BwSection:NewButton("Execute", "Executes The Bedwars Script", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
end)

-- Arsenal 
-- Tab
local AR = Window:NewTab("Arsenal")

-- Section
local ARSection = AR:NewSection("Arsenal")

-- Button
ARSection:NewButton("Owl Hub", "Executes The Owl Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)

-- Kat
-- Tab
local Kat = Window:NewTab("Kat")

-- Section
local KatSection = Kat:NewSection("Kat")

-- Button
KatSection:NewButton("Owl Hub", "Executes The Owl Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
end)

-- Murderer VS Sherrif
-- Tab
local KVS = Window:NewTab("Murderer VS Sherrif")

-- Section
local KVSSection = KVS:NewSection("Murderer VS Sherrif")

-- Button
KVSSection:NewButton("Excute", "Executes The Owl Hub", function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
end)



































































-- Keybind
-- Tab
local Kb = Window:NewTab("Keybind")

-- Section
local KbSection = Kb:NewSection("Kb")

-- Select Key
KbSection:NewKeybind("Select A Key", "Select A Key", Enum.KeyCode.F, function()
	Library:ToggleUI()
end)
