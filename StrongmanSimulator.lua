spawn(
    function()
        repeat
            wait()
        until game:IsLoaded()
        for _, v in pairs(game:GetService("Workspace").BadgeColliders:GetDescendants()) do
            if v.ClassName == "TouchTransmitter" then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position)
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(v.Parent.CFrame.Position)
            end
            wait(0.1)
        end
    end
)

local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(
    function()
        vu:Button2Down(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
        wait(1)
        vu:Button2Up(Vector2.new(0, 0), workspace.CurrentCamera.CFrame)
    end
)

local library =
    loadstring(game:HttpGet("https://raw.githubusercontent.com/GreenDeno/Venyx-UI-Library/main/source.lua"))()
local venyx = library.new("Void | Strongman Simulator", 5013109572)

local themes = {
    Background = Color3.fromRGB(24, 24, 24),
    Glow = Color3.fromRGB(0, 0, 0),
    Accent = Color3.fromRGB(10, 10, 10),
    LightContrast = Color3.fromRGB(20, 20, 20),
    DarkContrast = Color3.fromRGB(14, 14, 14),
    TextColor = Color3.fromRGB(255, 255, 255)
}

------------Tabs
local HomePage = venyx:addPage("Home", 6034287515)
local ChangeLogsSection = HomePage:addSection("Change-Logs")
local CreditSection = HomePage:addSection("Credits")
local InfoSection = HomePage:addSection("Infomation")
local AutoFarmPage = venyx:addPage("Autofarm", 6034837797)
local AutoFarmSection = AutoFarmPage:addSection("Autofarm")
local AutoFarmSettingSection = AutoFarmPage:addSection("Autofarm Settings")
local MiscPage = venyx:addPage("Misc", 6022668907)
local MiscSection = MiscPage:addSection("Misc")
local MiscSection2 = MiscPage:addSection("LocalPlayer")
local SettingPage = venyx:addPage("Setting", 6035202033)
local SettingSection = SettingPage:addSection("Settings")
local ThemeSection = SettingPage:addSection("Themes")

---------------------------------------------------------------

ChangeLogsSection:addButton(
    "+ More Items :)",
    function()
        print("Clicked")
    end
)

ChangeLogsSection:addButton(
    "+ Unlock All Area Badges :)",
    function()
        print("Clicked")
    end
)

ChangeLogsSection:addButton(
    "+ Custom Autofarm Speed",
    function()
        print("Clicked")
    end
)

ChangeLogsSection:addButton(
    "+ LocalPlayer Section",
    function()
        print("Clicked")
    end
)

InfoSection:addButton(
    "Void On Top",
    function()
        print("Clicked")
    end
)
------------------------
CreditSection:addButton(
    "Malware#6666",
    function()
        setclipboard("Malware#6666")
        print("Clicked")
    end
)

CreditSection:addButton(
    "https://discord.gg/7nEtPcHFDX",
    function()
        setclipboard("https://discord.gg/7nEtPcHFDX")
        print("Clicked")
    end
)
--
Items = {}
for i, v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
    if v.Name == "DraggableItems" then
        for i, v1 in pairs(v:GetChildren()) do
            if v1.ClassName == "MeshPart" or v1.ClassName == "Part" then
                table.insert(Items, v1.Title.Value)
            end
        end
    end
end

AutoFarmSection:addToggle(
    "Auto Gym",
    nil,
    function(value)
        P = game:GetService("Workspace").Areas.Area1.Gym.TrainingEquipment.WorkoutStation.Collider.ProximityPrompt
        game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =
            game:GetService("Workspace").Areas.Area1.Gym.TrainingEquipment.WorkoutStation.Collider.CFrame
        wait(0.1)

        P:InputHoldBegin()
        wait(0.3)
        P:InputHoldEnd()

        AutoGym = value
        while AutoGym do
            wait()
            game:GetService("ReplicatedStorage")["StrongMan_UpgradeStrength"]:InvokeServer()
        end
        print("Toggled", value)
    end
)

AutoFarmSection:addDropdown(
    "Select Item",
    Items,
    function(text)
        SelectedItem = text
        print("Selected", text)
    end
)

AutoFarmSection:addToggle(
    "Auto Grab Items",
    nil,
    function(value)
        AutoGrabItems = value
        while AutoGrabItems do
            wait(0.7)
            spawn(
                function()
                    local a, b =
                        pcall(
                        function()
                            for i, v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
                                if v.Name == "ProximityPrompt" then
                                    if v.Parent.Parent.Parent.Name == "DraggableItems" then
                                        if v.Parent.Parent.Title.Value == SelectedItem then
                                            local tweenInfo = TweenInfo.new(0)
                                            local t =
                                                game.TweenService:Create(
                                                game.Players.LocalPlayer.Character.PrimaryPart,
                                                tweenInfo,
                                                {
                                                    CFrame = CFrame.new(v.Parent.CFrame.Position + Vector3.new(0, 0, 0))
                                                }
                                            )
                                            t:Play()
                                            wait(.1)
                                            fireproximityprompt(v, 0)
                                            fireproximityprompt(v, 1)
                                        end
                                    end
                                end
                            end
                        end
                    )
                    print(a, b)
                end
            )
        end
        print("Toggled", value)
    end
)

AutoFarmSection:addToggle(
    "Auto Energry",
    nil,
    function(value)
        AutoEnergry = value
        AutoWalk = value
        while AutoEnergry do
            wait()
            for i, v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
                if v.ClassName == "StringValue" then
                    if v.Value == SelectedItem then
                        if v.Parent.Parent.Name == "DraggableItems" then
                            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = WalkSpeedAutoFarmSettings

                            local w = 0x57

                            function keydu(key)
                                keypress(key)
                                wait(0.5)
                                keyrelease(key)
                            end

                            keydu(w)
                        end
                    end
                end
            end
        end
        print("Toggled", value)
    end
)
-------
AutoFarmSettingSection:addSlider(
    "Select WalkSpeed",
    50,
    50,
    500,
    function(value)
        WalkSpeedAutoFarmSettings = game.Players.LocalPlayer.Character.Humanoid.WalkSpeed
        WalkSpeedAutoFarmSettings = value
        print("Dragged", value)
    end
)

AutoFarmSettingSection:addButton(
    "Reset Walkspeed",
    function()
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        print("Clicked")
    end
)
----------------------------------------------------------------

MiscSection:addButton(
    "Destroy All Doors",
    function()
        for i, v in pairs(game:GetService("Workspace").Areas:GetDescendants()) do
            if string.find(v.Name, "Exit") then
                v:Destroy()
            end
        end
        print("Clicked")
    end
)

MiscSection2:addSlider(
    "WalkSpeed",
    16,
    16,
    500,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = value
        print("Dragged", value)
    end
)

MiscSection2:addSlider(
    "JumpBoost",
    16,
    16,
    500,
    function(value)
        game.Players.LocalPlayer.Character.Humanoid.JumpPower = value
        print("Dragged", value)
    end
)
--

SettingSection:addKeybind(
    "Toggle Keybind",
    Enum.KeyCode.One,
    function()
        print("Activated Keybind")
        venyx:toggle()
    end,
    function()
        print("Changed Keybind")
    end
)

for SettingPage, color in pairs(themes) do
    ThemeSection:addColorPicker(
        SettingPage,
        color,
        function(color3)
            venyx:setTheme(SettingPage, color3)
        end
    )
end
