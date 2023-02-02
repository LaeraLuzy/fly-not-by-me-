-- Loadstring
local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))()

-- Window
local Window = Rayfield:CreateWindow({
    Name = "Sycthe",
    LoadingTitle = "Loading...",
    LoadingSubtitle = "by Sycthe",
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil, -- Create a custom folder for your hub/game
       FileName = "SyctheHub"
    },
    Discord = {
       Enabled = true,
       Invite = "6bzu3YJx", 
       RememberJoins = false
    },
    KeySystem = true, 
    KeySettings = {
       Title = "Sycthe Hub",
       Subtitle = "Enter Key",
       Note = "Join the discord for key (https://discord.gg/6bzu3YJx)",
       FileName = "SyctheKey",
       SaveKey = false,
       GrabKeyFromSite = false, 
       Key = "vcx_ASDNSkasdMsd231+=/"
    }
 })
 
 -- General
 -- Tab
 local Tab = Window:CreateTab("General", 4483362458)

 -- Section
 local Section = Tab:CreateSection("General Scripts")

 -- Button
 local Button = Tab:CreateButton({
    Name = "Infinite Yield",
    Callback = function()
    loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
 })

 local Button = Tab:CreateButton({
    Name = "Fly Script",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/LaeraLuzy/fly-not-by-me-/main/fly.lua",true))();
    end,
 })

 -- Toggle
 local Toggle = Tab:CreateToggle({
   Name = "ESP",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      local color = BrickColor.new(50,0,250)
      local transparency = .8
      
      local Players = game:GetService("Players")
      local function _ESP(c)
        repeat wait() until c.PrimaryPart ~= nil
        for i,p in pairs(c:GetChildren()) do
          if p.ClassName == "Part" or p.ClassName == "MeshPart" then
            if p:FindFirstChild("shit") then p.shit:Destroy() end
            local a = Instance.new("BoxHandleAdornment",p)
            a.Name = "shit"
            a.Size = p.Size
            a.Color = color
            a.Transparency = transparency
            a.AlwaysOnTop = true    
            a.Visible = true    
            a.Adornee = p
            a.ZIndex = true    
      
          end
        end
      end
      local function ESP()
        for i,v in pairs(Players:GetChildren()) do
          if v ~= game.Players.LocalPlayer then
            if v.Character then
              _ESP(v.Character)
            end
            v.CharacterAdded:Connect(function(chr)
              _ESP(chr)
            end)
          end
        end
        Players.PlayerAdded:Connect(function(player)
          player.CharacterAdded:Connect(function(chr)
            _ESP(chr)
          end)  
        end)
      end
      ESP()
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Aimbot",
   CurrentValue = false,
   Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(Value)
      local Camera = workspace.CurrentCamera
      local Players = game:GetService("Players")
      local RunService = game:GetService("RunService")
      local UserInputService = game:GetService("UserInputService")
      local TweenService = game:GetService("TweenService")
      local LocalPlayer = Players.LocalPlayer
      local Holding = false
      
      _G.AimbotEnabled = true
      _G.TeamCheck = false -- If set to true then the script would only lock your aim at enemy team members.
      _G.AimPart = "Head" -- Where the aimbot script would lock at.
      _G.Sensitivity = 0 -- How many seconds it takes for the aimbot script to officially lock onto the target's aimpart.
      
      _G.CircleSides = 64 -- How many sides the FOV circle would have.
      _G.CircleColor = Color3.fromRGB(255, 255, 255) -- (RGB) Color that the FOV circle would appear as.
      _G.CircleTransparency = 0.7 -- Transparency of the circle.
      _G.CircleRadius = 80 -- The radius of the circle / FOV.
      _G.CircleFilled = false -- Determines whether or not the circle is filled.
      _G.CircleVisible = true -- Determines whether or not the circle is visible.
      _G.CircleThickness = 0 -- The thickness of the circle.
      
      local FOVCircle = Drawing.new("Circle")
      FOVCircle.Position = Vector2.new(Camera.ViewportSize.X / 2, Camera.ViewportSize.Y / 2)
      FOVCircle.Radius = _G.CircleRadius
      FOVCircle.Filled = _G.CircleFilled
      FOVCircle.Color = _G.CircleColor
      FOVCircle.Visible = _G.CircleVisible
      FOVCircle.Radius = _G.CircleRadius
      FOVCircle.Transparency = _G.CircleTransparency
      FOVCircle.NumSides = _G.CircleSides
      FOVCircle.Thickness = _G.CircleThickness
      
      local function GetClosestPlayer()
         local MaximumDistance = _G.CircleRadius
         local Target = nil
      
         for _, v in next, Players:GetPlayers() do
            if v.Name ~= LocalPlayer.Name then
               if _G.TeamCheck == true then
                  if v.Team ~= LocalPlayer.Team then
                     if v.Character ~= nil then
                        if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                           if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                              local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                              local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                              
                              if VectorDistance < MaximumDistance then
                                 Target = v
                              end
                           end
                        end
                     end
                  end
               else
                  if v.Character ~= nil then
                     if v.Character:FindFirstChild("HumanoidRootPart") ~= nil then
                        if v.Character:FindFirstChild("Humanoid") ~= nil and v.Character:FindFirstChild("Humanoid").Health ~= 0 then
                           local ScreenPoint = Camera:WorldToScreenPoint(v.Character:WaitForChild("HumanoidRootPart", math.huge).Position)
                           local VectorDistance = (Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y) - Vector2.new(ScreenPoint.X, ScreenPoint.Y)).Magnitude
                           
                           if VectorDistance < MaximumDistance then
                              Target = v
                           end
                        end
                     end
                  end
               end
            end
         end
      
         return Target
      end
      
      UserInputService.InputBegan:Connect(function(Input)
          if Input.UserInputType == Enum.UserInputType.MouseButton2 then
              Holding = true
          end
      end)
      
      UserInputService.InputEnded:Connect(function(Input)
          if Input.UserInputType == Enum.UserInputType.MouseButton2 then
              Holding = false
          end
      end)
      
      RunService.RenderStepped:Connect(function()
          FOVCircle.Position = Vector2.new(UserInputService:GetMouseLocation().X, UserInputService:GetMouseLocation().Y)
          FOVCircle.Radius = _G.CircleRadius
          FOVCircle.Filled = _G.CircleFilled
          FOVCircle.Color = _G.CircleColor
          FOVCircle.Visible = _G.CircleVisible
          FOVCircle.Radius = _G.CircleRadius
          FOVCircle.Transparency = _G.CircleTransparency
          FOVCircle.NumSides = _G.CircleSides
          FOVCircle.Thickness = _G.CircleThickness
      
          if Holding == true and _G.AimbotEnabled == true then
              TweenService:Create(Camera, TweenInfo.new(_G.Sensitivity, Enum.EasingStyle.Sine, Enum.EasingDirection.Out), {CFrame = CFrame.new(Camera.CFrame.Position, GetClosestPlayer().Character[_G.AimPart].Position)}):Play()
          end
      end)
   end,
})
 
 -- Jailbreak
 -- Tab
 local Tab = Window:CreateTab("Jailbreak Scripts", 4483362458) 

-- Section
local Section = Tab:CreateSection("Jailbreak")

-- Button
 local Button = Tab:CreateButton({
   Name = "Chaos",
   Callback = function()
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/xChaoticVoid/Jailbreak/main/Chaos.lua'), true))()
   end,
})

-- Phantom Forces
-- Tab
local Tab = Window:CreateTab("Phantom Forces", 4483362458) 

-- Section
local Section = Tab:CreateSection("Phantom Forces Scripts")

-- Button
local Button = Tab:CreateButton({
    Name = "Silent Aim",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/The3Bakers4565/Spicy-Bagel/main/Other/Phantom_Forces/Silent_Aim.lua"))()
    end,
 })

 -- Button
local Button = Tab:CreateButton({
    Name = "Multi Hack",
    Callback = function()
        loadstring(game:HttpGet(('https://raw.githubusercontent.com/rblxscriptsnet/scripts/main/phantomforces1'),true))()
    end,
 })

 -- Bed Wars
 -- Tab
 local Tab = Window:CreateTab("Bed Wars", 4483362458) 

 -- Section
 local Section = Tab:CreateSection("Bed Wars Scripts")

 -- Button
local Button = Tab:CreateButton({
    Name = "Vape V4",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))()
    end,
 })

 -- Counter Blox 
 -- Tab
 local Tab = Window:CreateTab("Counter Blox", 4483362458) 

 -- Section
local Section = Tab:CreateSection("Counter Blox Scripts")

-- Button
local Button = Tab:CreateButton({
    Name = "Hexagon",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/Pawel12d/hexagon/main/scripts/CounterBlox.lua', true))()
    end,
 })

-- KAT
-- Tab
local Tab = Window:CreateTab("KAT Scripts", 4483362458) 

-- Section
local Section = Tab:CreateSection("KAT")

-- Button
local Button = Tab:CreateButton({
    Name = "Owl Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
    end,
 })

-- MURDERERS VS SHERRIFS
-- Tab
local Tab = Window:CreateTab("Murderers Vs Sherrifs Scripts", 4483362458) 

-- Section
local Section = Tab:CreateSection("Murderers Vs Sherrifs")

-- Button
local Button = Tab:CreateButton({
    Name = "Bebo",
    Callback = function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Bebo-Mods/BeboScripts/main/MurderersVsSheriffs.lua"))()
    end,
 })

 -- Arsenal
 -- Tab
 local Tab = Window:CreateTab("Arsenal", 4483362458) 
 
 -- Section
 local Section = Tab:CreateSection("Arsenal Scripts")

 -- Button
 local Button = Tab:CreateButton({
    Name = "Owl Hub",
    Callback = function()
        loadstring(game:HttpGet("https://raw.githubusercontent.com/CriShoux/OwlHub/master/OwlHub.txt"))();
    end,
 })

 local Button = Tab:CreateButton({
   Name = "StormWare Lite",
   Callback = function()
      _G.lockMeth = "Random" 
_G.silMeth = "FPORWIL" 
_G.AntiFly = false 
_G.Keystrokes = true 
_G.HideOverlay = false


local g = game:HttpGet("https://raw.githubusercontent.com/Storm99999/whitelistkeys/main/lite/sw.lite.lua")
loadstring(g:reverse())()
task.wait(2)
if _G.HideOverlay == true then
    game.CoreGui["StormWare LITE"].modules.Visible = false
end


game.CoreGui["StormWare LITE"].keystrokes.space.Text = "━━━━━"
   end,
})


 -- Blox Fruits
 -- Tab
 local Tab = Window:CreateTab("Blox Fruits", 4483362458) 

 -- Section
 local Section = Tab:CreateSection("Blox Fruits Scripts")

 -- Button
 local Button = Tab:CreateButton({
   Name = "OP GUI",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Chest Farm",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Steveee11/Scripts/main/Blox%20Fruits%20OP%20Script"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "MenuBF",
   Callback = function()
      loadstring(game:HttpGet('https://raw.githubusercontent.com/TUPERX/TUPERX/Main/MenuBF/README.md'))()
   end,
})

local Button = Tab:CreateButton({
    Name = "Auto Fruit",
    Callback = function()
        loadstring(game:HttpGet"https://gist.githubusercontent.com/NotHubris/4e6fdc88d84c30afa9b28c590f273bbf/raw")()
    end,
 })

-- Clicker Simulator
-- Tab
local Tab = Window:CreateTab("Clicker Simulator", 4483362458)

-- Section
local Section = Tab:CreateSection("Clicker Simulator Scripts")

-- Button
local Button = Tab:CreateButton({
    Name = "Project Meow",
    Callback = function()
        loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")()
 })


-- Da Hood
-- Tab
local Tab = Window:CreateTab("Da Hood", 4483362458)

-- Section
local Section = Tab:CreateSection("Da Hood Scripts")

-- Button
local Button = Tab:CreateButton({
   Name = "Whitelist",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Allvideo/test/main/Whitelist.txt"))()
   end,
})

local Button = Tab:CreateButton({
   Name = "Dahood GUI",
   Callback = function()
      loadstring(game:HttpGet("https://raw.githubusercontent.com/FarmyScript/Dahood-GUI-/main/README.md"))()
   end,
})

-- Ninja Legends
-- Tab
local Tab = Window:CreateTab("Ninja Legends", 4483362458)

-- Section
local Section = Tab:CreateSection("Ninja Legends Scripts")

-- Button
local Button = Tab:CreateButton({
   Name = "AutoFarm",
   Callback = function()
      loadstring(game:HttpGet(('https://raw.githubusercontent.com/romkich09/MainForRealium/main/ForRealium'),true))()
   end,
})

local Button = Tab:CreateButton({
    Name = "Project Meow",
    Callback = function()
        loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")()
 })

 -- Sonic Speed Simulator
 -- Tab
 local Tab = Window:CreateTab("Sonic Speed Simulator", 4483362458)

 -- Section
 local Section = Tab:CreateSection("Sonic Speed Simulator Scripts")

 -- Button
 local Button = Tab:CreateButton({
    Name = "Project Meow",
    Callback = function()
        loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")()
 })

-- Shindo Life
-- Tab
local Tab = Window:CreateTab("Shindo Life", 4483362458)

-- Section
local Section = Tab:CreateSection("Shindo Life Scripts")

-- Button
local Button = Tab:CreateButton({
    Name = "OP Script",
    Callback = function()
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/romkich09/MainForRealium/main/ForRealium'),true))()
    end,
 })

-- Pet Simulator X
-- Tab
local Tab = Window:CreateTab("Pet Simulator X", 4483362458)

-- Section
local Section = Tab:CreateSection("Pet Simulator X Scripts")

-- Button
local Button = Tab:CreateButton({
    Name = "Project Meow",
    Callback = function()
        loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")()
 })

-- Build A Boat For Treasure
-- Tab
local Tab = Window:CreateTab("Build A Bot For Treasure", 4483362458)

-- Section
local Section = Tab:CreateSection("Build A Boat For Treasure Scripts")

-- Button
local Button = Tab:CreateButton({
    Name = "Project Meow",
    Callback = function()
        loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")()
 })

 -- Goal Kick Simulator
 -- Tab
 local Tab = Window:CreateTab("Goal Kick Simulator", 4483362458)

 -- Section
 local Section = Tab:CreateSection("Goal Kick Simulator Scripts")

 -- Button
 local Button = Tab:CreateButton({
    Name = "Project Meow",
    Callback = function()
        loadstring(game:HttpGet"https://rawscripts.net/raw/Project-Meow_421")()
 })
