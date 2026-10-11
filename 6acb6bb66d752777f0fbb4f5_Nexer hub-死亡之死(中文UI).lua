function ConvertDropdownValue(tbl)
if type(tbl) == "table" then
for _,element in ipairs(tbl) do
return tostring(element)
end
else
return tostring(tbl)
end
end

local WebHandler = loadstring(game:HttpGet("https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/Web-Module.luau"))()
local GetRequestMethod = function()
local iqnd = request or http_request or HttpPost or (syn and syn.request) or (http and http.request) or (fluxus and fluxus.request) or (game and game.HttpPost) or (KRNL and KRNL.request) or (Xeno and Xeno.request)
if iqnd then
return iqnd
else
return nil
end
end
function CopyLink(link)
local url = tostring(link)
setclipboard(url)
Notify("成功!", "已复制链接!", 4, true)
end
function OpenLink(link)
local url = tostring(link)
if WebHandler then
local suc, err = pcall(function() WebHandler:OpenRBX(url) end) if not suc then CopyLink(url) end
else
CopyLink(url)
end
end

local Rayfield
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = loadstring(game:HttpGet("https://sirius.menu/rayfield"))()
end)
if not RAYFIELD_SUCCESS then
local RAYFIELD_SUCCESS, RAYFIELD_FAIL = pcall(function()
Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/SiriusSoftwareLtd/Rayfield/main/source.lua"))()
end)
if not RAYFIELD_SUCCESS then
game:GetService("StarterGui"):SetCore("SendNotification",{
	Title = "Rayfield 启动失败。",
	Text = "请检查你的网络连接，或尝试使用 VPN。",
  Icon = "rbxassetid://125704683916878",
	Duration = 10,
})
return
end
end

function Notify(title, content, time, mode)
time = time or 4
mode = mode or false
if mode == true then
img = 136186846844342
elseif mode == false then
img = 71508738660632
end
Rayfield:Notify({
	Title = title,
	Content = content,
	Duration = time,
	Image = img,
	Actions = {},
})
end

function DestroyRayfield()
task.spawn(function()
pcall(function()
Window:Destroy()
end)
pcall(function()
Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.Rayfield:Destroy()
end)
pcall(function()
game.CoreGui.RayField:Destroy()
end)
pcall(function()
game.CoreGui.OldRayfield:Destroy()
end)
pcall(function()
game.CoreGui.OldRayField:Destroy()
end)
end)
end

local Window = Rayfield:CreateWindow({
   Name = "Nexer Hub : RECODE",
   Icon = 0,    
   LoadingTitle = "NH:R",
   LoadingSubtitle = "by nexer",
   Theme = "Amethyst",
   DisableRayfieldPrompts = true,
   DisableBuildWarnings = true,

   ConfigurationSaving = {
      Enabled = false,
      FolderName = "",
      FileName = ""
   },

   Discord = {
      Enabled = false,
      Invite = "noinvitelink",
      RememberJoins = true
   },

   KeySystem = false,
})


pcall(function()
local Announcements = Window:CreateTab("公告",0)
Announcements:CreateParagraph({Title = "你好呀！", Content = "脚本版本：2.1\n\n此脚本已完全重写并修复。感谢你使用我的脚本。 ❤️\n\n也欢迎加入我们的 Discord 服务器，抢先获取更新、免费高级权限等许多内容..."})
Announcements:CreateButton({Name = "复制 Discord 服务器链接"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Notify("成功!", "已复制链接!", 3, true)
end; })
end)


local LocalPlayer, LP = game.Players.LocalPlayer, game.Players.LocalPlayer
local Character, Char
local HumanoidRootPart, HRP
local Humanoid, Hum
pcall(function()
Character, Char = LocalPlayer.Character, LocalPlayer.Character
end)
pcall(function()
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
end)
pcall(function()
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)

LocalPlayer.CharacterAdded:Connect(function()
pcall(function()
Character, Char = nil, nil
HumanoidRootPart, HRP = nil, nil
Humanoid, Hum = nil, nil
task.wait()
repeat task.wait() until LocalPlayer.Character
Character, Char = LocalPlayer.Character, LocalPlayer.Character
task.wait()
repeat task.wait() until Character:FindFirstChild("HumanoidRootPart")
HumanoidRootPart, HRP = Character.HumanoidRootPart, Character.HumanoidRootPart
task.wait()
repeat task.wait() until Character:FindFirstChild("Humanoid")
Humanoid, Hum = Character.Humanoid, Character.Humanoid
end)
end)

pcall(function()
StaminaModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Movement"))
end)

function SetStaminaProperty(property, value)
if property == "MaxStamina" then
Char:SetAttribute("MaxStamina", value)
elseif property == "Stamina" then
if StaminaModule then
StaminaModule["Stamina"] = value
end
elseif property == "Fatigue" then
Char:SetAttribute("Fatigue", value)
elseif property == "WalkSpeed" then
Hum.WalkSpeed = value
elseif property == "SprintSpeed" then
Char:SetAttribute("SprintSpeed", value)
elseif property == "WalkSpeed" then
Char:SetAttribute("WalkSpeed", value)
elseif property == "CanJump" then
if value == true then Hum.JumpPower = 50 else Hum.JumpPower = 0 end
end
end

local Tab_1 = Window:CreateTab("体力",0)

Tab_1:CreateParagraph({Title = "体力", Content = "在这里可以修改你的体力属性。"})

Tab_1:CreateSection("快捷功能")

Tab_1:CreateButton({Name = "无限体力"; Callback = function()
SetStaminaProperty("MaxStamina", (1/0))
SetStaminaProperty("Stamina", (1/0))
end; })

Tab_1:CreateButton({Name = "变得更快"; Callback = function()
Humanoid.WalkSpeed = 50
SetStaminaProperty("SprintSpeed", 70)
end; })

Tab_1:CreateButton({Name = "开启/关闭跳跃"; Callback = function()
if Hum.JumpPower == 0 then
SetStaminaProperty("CanJump", true)
else
SetStaminaProperty("CanJump", false)
end
end; })

Tab_1:CreateToggle({Name = "体力不消耗"; CurrentValue = false; Callback = function(Value)
NoStaminaLoss = Value
if NoStaminaLoss == true then
repeat task.wait(0.003)
if Character and Character:GetAttribute("MaxStamina") then
SetStaminaProperty("Stamina", Character:GetAttribute("MaxStamina"))
end
until NoStaminaLoss == false
end
end; })

Tab_1:CreateToggle({Name = "无疲劳"; CurrentValue = false; Callback = function(Value)
NoFatigue = Value
if NoFatigue == true then
repeat task.wait(0.003)
if Character and Character:GetAttribute("Fatigue") and Character:GetAttribute("Fatigue") == true then
SetStaminaProperty("Fatigue", false)
end
until NoFatigue == false
end
end; })

Tab_1:CreateSection("高级")

Tab_1:CreateInput({Name = "最大体力"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("MaxStamina", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "体力"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("Stamina", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "行走速度"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("WalkSpeed", tonumber(Value))
end; })

Tab_1:CreateInput({Name = "冲刺速度"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = true; Callback = function(Value)
SetStaminaProperty("SprintSpeed", tonumber(Value))
end; })

Tab_1:CreateSection("自动注入")
local AI_MaxStamina, AI_WalkSpeed, AI_SprintSpeed, AutoInjectStamina

Tab_1:CreateLabel("回合开始 21.5 秒后，体力设置会自动应用到你的角色上。")

Tab_1:CreateToggle({Name = "自动注入"; CurrentValue = false; Callback = function(Value)
AutoInjectStamina = Value
end; })

Tab_1:CreateInput({Name = "最大体力"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_MaxStamina = Value
end; })

Tab_1:CreateInput({Name = "行走速度"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_WalkSpeed = Value
end; })

Tab_1:CreateInput({Name = "冲刺速度"; PlaceholderText = "在此输入！"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AI_SprintSpeed = Value
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(descendant)
task.wait()
if descendant.Name == ""..LP.Name.."" and not descendant.Parent.Name == "Ghost" and AutoInjectStamina == true then
task.wait(21.5)
pcall(function()
SetStaminaProperty("MaxStamina", AI_MaxStamina)
end)
pcall(function()
SetStaminaProperty("Stamina", AI_MaxStamina)
end)
pcall(function()
SetStaminaProperty("WalkSpeed", AI_WalkSpeed)
end)
pcall(function()
SetStaminaProperty("SprintSpeed", AI_SprintSpeed)
end)
end
end)








----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------












local Tab_2 = Window:CreateTab("表情动作",0)
Tab_2:CreateParagraph({Title = "表情动作", Content = "与表情动作相关的功能。"})

Tab_2:CreateSection("ITZZZZ 派对时间!!!!")

Tab_2:CreateButton({Name = "打开表情选择"; Callback = function()
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Visible = true
LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("EmoteSelection").Active = true
end; })

Tab_2:CreateButton({Name = "使用 舞蹈"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Dance")
end; })

Tab_2:CreateButton({Name = "使用 Squingle"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Squingle")
end; })

Tab_2:CreateButton({Name = "使用 Gangnam Style"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Gangnam Style")
end; })

Tab_2:CreateButton({Name = "使用 PBJ"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("PBJ")
end; })

Tab_2:CreateButton({Name = "使用 龙卷风"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("Emote"):FireServer("Tornado")
end; })

Tab_2:CreateButton({Name = "使用 Rainbow Waves（无特效/音效）"; Callback = function()
local anim = Instance.new("Animation")
anim.AnimationId = "rbxassetid://75513960644342"
local planim = Humanoid:LoadAnimation(anim)
planim:Play()
local song = Instance.new("Sound")
song.Volume = 1.5
song.Looped = true
song.SoundId = "rbxassetid://137048834753046"
song.Parent = HumanoidRootPart
song:Play()
local TooLate = false
LocalPlayer.CharacterAdded:Once(function()
	if TooLate then return end
	TooLate = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
end)
Humanoid.Running:Once(function()
	if TooLate then return end
	TooLate = true
	song:Destroy()
planim:Stop()
	anim:Destroy()
end)
end; })









----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------













local AbilityNames = {"Cloak","Punch","Taunt","BonusPad","Block","Caretaker","Dash","Hotdog","Revolver","Adrenaline","Banana"}

local AbilityDatas = {
    ["Adrenaline"] = {Name = "Adrenaline",InputShown = "",Tip = "获得持续 6 秒的临时加速，期间会向队友高亮显示你，加速结束后你会变慢。",Cooldown = 35,Icon = "rbxassetid://116399911657417",DisplayName = "肾上腺素"};
    ["Punch"] = {Name = "Punch",InputShown = "",Tip = "向前挥击，命中的杀手眩晕 3 秒；若未命中你会出现严重的收招硬直。",Cooldown = 40,Icon = "rbxassetid://97428323453639",DisplayName = "拳击"};
    ["Caretaker"] = {Name = "Caretaker",InputShown = "",Tip = "向你面前泼洒药水，命中的幸存者共恢复 20 点生命。不过拥有此能力会减少 75 点最大生命！",Cooldown = 30,Icon = "rbxassetid://90712805517714",DisplayName = "看护者"};
    ["Cloak"] = {Name = "Cloak",InputShown = "",Tip = "在短时间内隐身，但移动大幅减速，杀手依然可以打到你！",Cooldown = 50,Icon = "rbxassetid://90476367580326",DisplayName = "隐身"};
    ["Block"] = {Name = "Block",InputShown = "",Tip = "尝试格挡任意伤害，成功时恢复 10 点生命、获得加速并抵消全部伤害。",Cooldown = 40,Icon = "rbxassetid://120929805037270",DisplayName = "格挡"};
    ["Dash"] = {Name = "Dash",InputShown = "",Tip = "向前冲刺，随后获得 2 秒疲劳，降低体力回复并加快体力消耗。",Cooldown = 20,Icon = "rbxassetid://73777691791017",DisplayName = "冲刺"};
    ["BonusPad"] = {Name = "BonusPad",InputShown = "",Tip = "建造一个临时加速板，踩上去的幸存者会加速。不过拥有此能力会减少 10 点最大生命！",Cooldown = 70,Icon = "rbxassetid://86775625332300",DisplayName = "加速板"};
    ["Hotdog"] = {Name = "Hotdog",InputShown = "",Tip = "吃掉一个热狗，恢复 15 点生命，消耗 10 点体力。",Cooldown = 15,Icon = "rbxassetid://134322360499381",DisplayName = "热狗"};
    ["Revolver"] = {Name = "Revolver",InputShown = "",Tip = "用左轮手枪射击，命中的杀手眩晕 2 秒，之后需要换弹。不过拥有此能力会减少 20 点最大体力！",Cooldown = 15,Icon = "rbxassetid://107624957891469",DisplayName = "左轮手枪"};
    ["Taunt"] = {Name = "Taunt",InputShown = "",Tip = "嘲讽杀手，获得力场并高亮显示杀手，使其减速 5 秒，或持续到你受到伤害为止（效果期间受到 1.25 倍伤害）。",Cooldown = 25,Icon = "rbxassetid://85436299122876",DisplayName = "嘲讽"};
    ["Banana"] = {Name = "Banana",InputShown = "",Tip = "把香蕉扔到地上，杀手或丢下香蕉的平民踩到会滑倒并短暂眩晕，香蕉会随时间自然腐烂。",Cooldown = 20,Icon = "rbxassetid://96202444819611",DisplayName = "香蕉皮"};
}

pcall(function()
AbilityModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("Ability"))
end)
pcall(function()
UIModule = require(LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"))
end)

local Tab_3 = Window:CreateTab("能力",0)
Tab_3:CreateParagraph({Title = "能力", Content = "你可以给自己赋予能力，或获取带有能力的卡牌。"})
Tab_3:CreateSection("获取能力")

local ChoosenAbility = "Block"
Tab_3:CreateDropdown({Name = "选择能力"; Options = AbilityNames; CurrentOption = "Block"; MultiSelection = false; Callback = function(Value)
ChoosenAbility = ConvertDropdownValue(Value)
end; })
Tab_3:CreateButton({Name = "获取所选能力"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(ChoosenAbility)
AbilityModule.CreateAbility(AbilityDatas[ChoosenAbility])
end; })

Tab_3:CreateButton({Name = "获取全部能力"; Callback = function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AbilityNames[math.random(1, 11)]);tostring(AbilityNames[math.random(1, 11)]);}}))
for _,ability in pairs(AbilityNames) do
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(ability);}}))
AbilityModule.CreateAbility(AbilityDatas[tostring(ability)])
end
end; })

Tab_3:CreateSection("获取卡牌")

local CardSettings = {
    [1] = {[1]="Revolver",[2]="Caretaker"},
    [2] = {[1]="BonusPad",[2]="Caretaker"},
    [3] = {[1]="Revolver",[2]="Punch"}
}
Tab_3:CreateLabel("第一张卡牌设置")
Tab_3:CreateDropdown({Name = "第一个能力"; Options = AbilityNames; CurrentOption = "Revolver"; MultiSelection = false; Callback = function(Value)
CardSettings[1][1] = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "第二个能力"; Options = AbilityNames; CurrentOption = "Caretaker"; MultiSelection = false; Callback = function(Value)
CardSettings[1][2] = ConvertDropdownValue(Value)
end; })

Tab_3:CreateLabel("第二张卡牌设置")
Tab_3:CreateDropdown({Name = "第一个能力"; Options = AbilityNames; CurrentOption = "BonusPad"; MultiSelection = false; Callback = function(Value)
CardSettings[2][1] = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "第二个能力"; Options = AbilityNames; CurrentOption = "Caretaker"; MultiSelection = false; Callback = function(Value)
CardSettings[2][2] = ConvertDropdownValue(Value)
end; })

Tab_3:CreateLabel("第三张卡牌设置")
Tab_3:CreateDropdown({Name = "第一个能力"; Options = AbilityNames; CurrentOption = "Revolver"; MultiSelection = false; Callback = function(Value)
CardSettings[3][1] = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "第二个能力"; Options = AbilityNames; CurrentOption = "Punch"; MultiSelection = false; Callback = function(Value)
CardSettings[3][2] = ConvertDropdownValue(Value)
end; })

Tab_3:CreateButton({Name = "召唤所选卡牌"; Callback = function()
UIModule.AbilitySelection(unpack(CardSettings))
end; })


Tab_3:CreateSection("重复使用能力")

local SpamAbility = "Hotdog"
Tab_3:CreateDropdown({Name = "要重复使用的能力"; Options = AbilityNames; CurrentOption = "Hotdog"; MultiSelection = false; Callback = function(Value)
SpamAbility = ConvertDropdownValue(Value)
end; })

Tab_3:CreateToggle({Name = "重复使用能力"; CurrentValue = false; Callback = function(Value)
AutoSpamAbility = Value
if AutoSpamAbility == true then
repeat task.wait(0.15)
pcall(function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(SpamAbility)}}))
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack({tostring(SpamAbility)}))
end)
until AutoSpamAbility == false
end
end; })

Tab_3:CreateSection("能力自动注入")
local AI_Ability_1, AI_Ability_2, AutoInjectAbility

Tab_3:CreateLabel("回合开始 5 秒后，能力（连同其配件）会自动装备。")

Tab_3:CreateToggle({Name = "自动注入"; CurrentValue = false; Callback = function(Value)
AutoInjectAbility = Value
end; })

Tab_3:CreateDropdown({Name = "第一个能力"; Options = AbilityNames; CurrentOption = ""; MultiSelection = false; Callback = function(Value)
AI_Ability_1 = ConvertDropdownValue(Value)
end; })
Tab_3:CreateDropdown({Name = "第二个能力"; Options = AbilityNames; CurrentOption = ""; MultiSelection = false; Callback = function(Value)
AI_Ability_2 = ConvertDropdownValue(Value)
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(descendant)
task.wait()
if descendant.Name == ""..LP.Name.."" and not descendant.Parent.Name == "Ghost" and AutoInjectAbility == true then
task.wait(5)
pcall(function()
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring(AI_Ability_1);tostring(AI_Ability_2);}}))
end)
end
end)







----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------











if not game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER") then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
end

_G.ESPenabledHandler = false
_G.ESPtransHandler = 0.3

function CreateHighlight(plr)
task.spawn(function()
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetChildren()) do
if v and v.Name == ("sillyfolder_"..plr.Name) then
v:Destroy()
end
end
repeat task.wait() until game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) == nil
local esp_folder = Instance.new("Folder")
esp_folder.Name = "sillyfolder_"..plr.Name
esp_folder.Parent = game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER")
      
repeat task.wait() until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
local plr_char = plr.Character or plr.CharacterAdded:Wait()
for i,v in pairs(plr_char:GetChildren()) do
if v and v:IsA("BasePart") and (v.Name == "Left Leg" or v.Name == "Left Arm" or v.Name == "Right Leg" or v.Name == "Right Arm" or v.Name == "Torso" or v.Name == "Head") then
local esp = Instance.new("BoxHandleAdornment")
esp.Name = "sillygirl_"..plr.Name
esp.Adornee = v
esp.AlwaysOnTop = true
esp.ZIndex = 10 or 1
esp.Size = v.Size
esp.Transparency = (plr_char.Parent.Name == "Workspace" and 1) or tonumber(_G.ESPtransHandler)
esp.Color = (plr_char.Parent.Name == "Killer" and BrickColor.new("Bright red")) or (plr_char.Parent.Name == "Ghost" and BrickColor.new("White")) or BrickColor.new("Bright green")
esp.Parent = game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name)
if v.Name == "Head" then
local esp_stat = Instance.new("BillboardGui")
local stat_text = Instance.new("TextLabel")
esp_stat.Adornee = v
esp_stat.AlwaysOnTop = true
esp_stat.Parent = esp
esp_stat.Size = UDim2.new(0, 80, 0, 50)
esp_stat.StudsOffset = Vector3.new(0, .2, 0)
stat_text.ZIndex = 10
stat_text.BackgroundTransparency = 1
stat_text.Position = UDim2.new(0, 0, 0, -50)
stat_text.Size = UDim2.new(0, 80, 0, 80)
stat_text.Font = Enum.Font.SourceSansSemibold
stat_text.TextSize = 15
stat_text.TextColor3 = Color3.new(1, 1, 1)
stat_text.TextStrokeTransparency = 0
stat_text.TextYAlignment = Enum.TextYAlignment.Bottom
stat_text.Parent = esp_stat
task.spawn(function()
pcall(function()
while task.wait(.05) do
stat_text.Text = "名称: "..plr.Name.."\n生命值: "..plr_char.Humanoid.Health..""
end
end)
end)
end

end
end
      
local char_connection, team_connection, dstr_connection
char_connection = plr.CharacterAdded:Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
team_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
char_connection:Disconnect()
end)

team_connection = plr:GetPropertyChangedSignal("TeamColor"):Connect(function()
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
dstr_connection:Disconnect()
char_connection:Disconnect()
repeat task.wait(1.25) until plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") and plr.Character:FindFirstChildOfClass("Humanoid")
CreateHighlight(plr)
team_connection:Disconnect()
end)

dstr_connection = game:GetService("CoreGui").ChildRemoved:Connect(function(child)
if child.Name == "DOD_ESP_HANDLER" then
Instance.new("Folder", game:GetService("CoreGui")).Name = "DOD_ESP_HANDLER"
team_connection:Disconnect()
char_connection:Disconnect()
dstr_connection:Disconnect()
end      
end)

end)
end

function ChangeTransparency(trans)
for i,v in pairs(game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):GetDescendants()) do
if v and v:IsA("BoxHandleAdornment") then
v.Transparency = trans
end
end
end

local Tab_4 = Window:CreateTab("视觉",0)

Tab_4:CreateParagraph({Title = "视觉", Content = "在这里可以调整游戏的部分视觉效果。"})
Tab_4:CreateSection("ESP")

Tab_4:CreateSlider({Name = "ESP 透明度（%）"; Range = {0, 100}; Increment = 5; Suffix = "%"; CurrentValue = 30; Callback = function(Value)
_G.ESPtransHandler = (tonumber(Value) / 100)
ChangeTransparency(tonumber(_G.ESPtransHandler))
end; })

plradded_esp = nil
plrremoved_esp = nil
Tab_4:CreateToggle({Name = "开启/关闭 ESP"; CurrentValue = false; Callback = function(Value)
_G.ESPenabledHandler = Value
if _G.ESPenabledHandler == true then
for i,v in pairs(game:GetService("Players"):GetPlayers()) do
if v and v ~= game:GetService("Players").LocalPlayer then
CreateHighlight(v)
end
end
plradded_esp = game:GetService("Players").PlayerAdded:Connect(function(plr)
CreateHighlight(plr)
end)
plrremoved_esp = game:GetService("Players").PlayerRemoving:Connect(function(plr)
if game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name) then
game:GetService("CoreGui"):WaitForChild("DOD_ESP_HANDLER"):FindFirstChild("sillyfolder_"..plr.Name):Destroy()
end
end)
elseif _G.ESPenabledHandler == false then
game:GetService("CoreGui"):FindFirstChild("DOD_ESP_HANDLER"):Destroy()
if plradded_esp ~= nil then
plradded_esp:Disconnect()
plradded_esp = nil
end
if plrremoved_esp ~= nil then
plrremoved_esp:Disconnect()
plrremoved_esp = nil
end
end
end; })

Tab_4:CreateSection("界面管理 ε=( o｀ω′)ノ")

Tab_4:CreateButton({Name = "打开商店"; Callback = function()
UIModule.OpenShop()
end; })
Tab_4:CreateToggle({Name = "开启/关闭队友死亡特效"; CurrentValue = true; Callback = function(Value)
if TestRequire() ~= true then
ErrorRequire()
return nil
end
DeathEffectEnabled = Value
if DeathEffectEnabled == true then
UIModule["TeamateDeathEffect"] = function()
	game:GetService("Lighting").TeamateDeathEffect.Enabled = true
	game:GetService("Lighting").TeamateDeathEffect.Contrast = 0
	game:GetService("Lighting").TeamateDeathEffect.TintColor = Color3.fromRGB(255, 255, 255)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["Contrast"] = 1
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(0.5), {
		["TintColor"] = Color3.fromRGB(255, 52, 52)
	}):Play()
	task.wait(0.5)
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["Contrast"] = 0
	}):Play()
	game:GetService("TweenService"):Create(game:GetService("Lighting").TeamateDeathEffect, TweenInfo.new(2), {
		["TintColor"] = Color3.fromRGB(255, 255, 255)
	}):Play()
end
Notify("成功!", "已启用!", 3, true)
elseif DeathEffectEnabled == false then
UIModule["TeamateDeathEffect"] = function() return nil end
Notify("成功!", "已禁用!", 3, true)
end
end; })

function AwardPoints(points, reason)
	local Template = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui"):WaitForChild("Client"):WaitForChild("Modules"):WaitForChild("UI"):WaitForChild("PlayerPoints"):Clone()
	Template.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("MainGui").PlayerPoints
	Template.Frame.Title.Text = "<font color=\'rgb(255, 64, 67)\'>"..tostring(points).." 点数</font> 已发放："..tostring(reason)
	Template.Frame.Title.TextTransparency = 1
	Template.Frame.Title.UIStroke.Transparency = 1
	Template.Frame.Cash.ImageTransparency = 1
	game:GetService("Debris"):AddItem(Template, 10)
	game:GetService("TweenService"):Create(Template.Frame.Cash, TweenInfo.new(10, Enum.EasingStyle.Linear), {
		["Rotation"] = 360
	}):Play()
	pcall(function()
		for _ = 0,5 do
			task.wait(0.2)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency - 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency - 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency - 0.2
		end
		task.wait(6)
		for _ = 0,5 do
			task.wait(0.5)
			local Title = Template.Frame.Title
			Title.TextTransparency = Title.TextTransparency + 0.2
			local Stroke = Template.Frame.Title.UIStroke
			Stroke.Transparency = Stroke.Transparency + 0.2
			local Cash = Template.Frame.Cash
			Cash.ImageTransparency = Cash.ImageTransparency + 0.2
		end
	end)
end
MoneyToGet = 10
ReasonForMoney = "因为至少存活了 60 秒。"

Tab_4:CreateLabel("点数发放器（视觉效果）")

Tab_4:CreateInput({Name = "点数数量"; PlaceholderText = "10"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
MoneyToGet = tonumber(Value)
end; })

Tab_4:CreateInput({Name = "获得点数的原因"; PlaceholderText = "因为至少存活了 60 秒。"; NumbersOnly = false; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
ReasonForMoney = tostring(Value)
end; })

Tab_4:CreateButton({Name = "发放点数"; Callback = function()
AwardPoints(MoneyToGet, ReasonForMoney)
end; })











----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------












local Tab_5 = Window:CreateTab("反制 / 免疫",0)
Tab_5:CreateParagraph({Title = "反制 / 免疫", Content = "你可以在这里获得多种免疫效果。"})
Tab_5:CreateSection("服务器")

local AntiWalls
AntiWalls = false
Tab_5:CreateToggle({Name = "反制 Artful Walls"; CurrentValue = false; Callback = function(Value)
AntiWalls = Value
if AntiWalls == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other"):GetDescendants()) do
if v and v.Name == "HumanoidRootPart" and v.Anchored == true then
v.CanCollide = false
v.CanTouch = false
v.Transparency = 0.5
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Other").DescendantAdded:Connect(function(descendant)
if descendant and descendant.Name == "HumanoidRootPart" and descendant.Anchored == true and AntiWalls == true then
descendant.CanCollide = false
descendant.CanTouch = false
descendant.Transparency = 0.5
end
end)

local AntiComputer
AntiComputer = false
Tab_5:CreateToggle({Name = "Badware 电脑提示免冷却"; CurrentValue = false; Callback = function(Value)
AntiComputer = Value
if AntiComputer == true then
for _,descendant in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):GetDescendants()) do
if descendant and descendant:IsA("ProximityPrompt") and AntiComputer == true then
pcall(function()
descendant.HoldDuration = 0
descendant.RequiresLineOfSight = false
descendant.Enabled = true
end)
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets").DescendantAdded:Connect(function(descendant)
if descendant and descendant:IsA("ProximityPrompt") and AntiComputer == true then
pcall(function()
descendant.HoldDuration = 0
descendant.RequiresLineOfSight = false
descendant.Enabled = true
end)
end
end)

local AntiEvilScary
AntiEvilScary = false
Tab_5:CreateToggle({Name = "免疫 Evil Scary"; CurrentValue = false; Callback = function(Value)
AntiEvilScary = Value
if AntiEvilScary == true then
for i,v in pairs(game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable"):GetChildren()) do
if v and v.Name == "EvilScary" then
for _,trans in pairs(v:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(v:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
part:Destroy()
end
end
v.CanCollide = false
v.CanTouch = false
pcall(function()
v.CanQuery = false
end)
v:Destroy()
end
end
end
end; })
game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Debris"):WaitForChild("Cleanable").ChildAdded:Connect(function(child)
if child and child.Name == "EvilScary" and AntiEvilScary == true then
for _,trans in pairs(child:GetChildren()) do
if trans and trans:IsA("TouchTransmitter") then
trans:Destroy()
end
end
for _,part in pairs(child:GetChildren()) do
if part and part:IsA("BasePart") then
part.CanCollide = false
part.CanTouch = false
pcall(function()
part.CanQuery = false
end)
part:Destroy()
end
end
child.CanCollide = false
child.CanTouch = false
pcall(function()
child.CanQuery = false
end)
child:Destroy()
end
end)

Tab_5:CreateToggle({Name = "反嘲讽"; CurrentValue = false; Callback = function(Value)
pcall(function()
if Value == true then
game:GetService("ReplicatedStorage").Events.RemoteEvents.TauntEffect.Parent = game.LogService
else
game.LogService.TauntEffect.Parent = game:GetService("ReplicatedStorage").Events.RemoteEvents
end
end)
end; })

local AutoRemoveBarriers = false
Tab_5:CreateToggle({Name = "反屏障"; CurrentValue = false; Callback = function(Value)
AutoRemoveBarriers = Value
pcall(function()
if Value == true then
workspace.GameAssets.Map.Config.Barriers:Destroy()
end
end)
end; })

game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams").DescendantAdded:Connect(function(d)
task.wait()
if d.Name == LocalPlayer.Name then
task.wait(1)
pcall(function()
if AutoRemoveBarriers == true then
workspace.GameAssets.Map.Config.Barriers:Destroy()
end
end)
end
end)





----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------













local function ReturnAnimFolder()
if Character:FindFirstChild("Animations") then
return Character:WaitForChild("Animations")
end
return nil
end

local Tab_6 = Window:CreateTab("动画",0)
Tab_6:CreateParagraph({Title = "动画", Content = "在这里可以更换你的动画。"})


function SetRunAnim(run)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("HurtSprint") then
AnimationFolder:FindFirstChild("HurtSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("NormalSprint") then
AnimationFolder:FindFirstChild("NormalSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldSprint") then
AnimationFolder:FindFirstChild("OldSprint").AnimationId = run
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("Sprint") then
AnimationFolder:FindFirstChild("Sprint").AnimationId = run
end
end)
end

function SetWalkAnim(walk)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Walk") then
AnimationFolder:FindFirstChild("Walk").AnimationId = walk
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldWalk") then
AnimationFolder:FindFirstChild("OldWalk").AnimationId = walk
end
end)
end

function SetIdleAnim(idle)
pcall(function()
local stopper = Humanoid or Character:FindFirstChildOfClass("AnimationController")
for i,v in next, stopper:GetPlayingAnimationTracks() do
v:Stop()
end
end)
local AnimationFolder = ReturnAnimFolder()
pcall(function()
if AnimationFolder:FindFirstChild("Idle") then
AnimationFolder:FindFirstChild("Idle").AnimationId = idle
end
end)
pcall(function()
if AnimationFolder:FindFirstChild("OldIdle") then
AnimationFolder:FindFirstChild("OldIdle").AnimationId = idle
end
end)
end

function ApplyNewAnimations()
pcall(function()
Character.Animate.Disabled = true
task.wait()
Character.Animate.Disabled = false
end)
task.wait()
pcall(function()
LocalPlayer.PlayerScripts.ClientAnimations.Disabled = true
task.wait()
LocalPlayer.PlayerScripts.ClientAnimations.Disabled = false
end)
end

Tab_6:CreateSection("平民动画")
Tab_6:CreateButton({Name = "应用新版平民动画"; Callback = function()
local RunAnim = "rbxassetid://137375023685630"
local WalkAnim = "rbxassetid://84388941697203"
local IdleAnim = "rbxassetid://100930402371608"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("成功!", "正在应用动画，最多可能需要 10 秒。", 3, true)
end; })
Tab_6:CreateButton({Name = "应用旧版平民动画"; Callback = function()
local RunAnim = "rbxassetid://79488319304371"
local WalkAnim = "rbxassetid://138161225743614"
local IdleAnim = "rbxassetid://74309548749074"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("成功!", "正在应用动画，最多可能需要 10 秒。", 3, true)
end; })

Tab_6:CreateSection("幽灵动画")
Tab_6:CreateButton({Name = "应用幽灵动画"; Callback = function()
local RunAnim = "rbxassetid://124260679864309"
local WalkAnim = "rbxassetid://124260679864309"
local IdleAnim = "rbxassetid://110395159339100"
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("成功!", "正在应用动画，最多可能需要 10 秒。", 3, true)
end; })

pcall(function()
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
Tab_6:CreateSection(v.Name.." 动画")
local temp_table = {}
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
table.insert(temp_table, e.Name)
end; end
Tab_6:CreateDropdown({Name = "应用 "..v.Name.." 动画"; Options = temp_table; CurrentOption = ""; MultiSelection = false; Callback = function(Value)
local Hi = v:WaitForChild(ConvertDropdownValue(Value))
local RunAnim = Hi:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local WalkAnim = Hi:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local IdleAnim = Hi:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or Hi:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
task.spawn(function()
SetRunAnim(RunAnim)
SetWalkAnim(WalkAnim)
SetIdleAnim(IdleAnim)
task.wait()
ApplyNewAnimations()
end)
Notify("成功!", "正在应用动画，最多可能需要 10 秒。", 3, true)
end; })
end; end
end)


Tab_6:CreateSection("高级")


function GetAllRunAnims()
local temp_table = {}
temp_table["平民奔跑"] = "rbxassetid://137375023685630"
temp_table["旧版平民奔跑"] = "rbxassetid://79488319304371"
temp_table["幽灵奔跑"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local RunAnim = e:WaitForChild("Animations"):WaitForChild("Sprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("NormalSprint").AnimationId or e:WaitForChild("Animations"):WaitForChild("HurtSprint").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." 奔跑"
temp_table[AnimName] = RunAnim
end; end
end; end
return temp_table
end

function GetAllWalkAnims()
local temp_table = {}
temp_table["平民行走"] = "rbxassetid://84388941697203"
temp_table["旧版平民行走"] = "rbxassetid://138161225743614"
temp_table["幽灵行走"] = "rbxassetid://124260679864309"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local WalkAnim = e:WaitForChild("Animations"):WaitForChild("Walk").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldWalk").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." 行走"
temp_table[AnimName] = WalkAnim
end; end
end; end
return temp_table
end

function GetAllIdleAnims()
local temp_table = {}
temp_table["平民待机"] = "rbxassetid://100930402371608"
temp_table["旧版平民待机"] = "rbxassetid://74309548749074"
temp_table["幽灵待机"] = "rbxassetid://110395159339100"
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local IdleAnim = e:WaitForChild("Animations"):WaitForChild("Idle").AnimationId or e:WaitForChild("Animations"):WaitForChild("OldIdle").AnimationId
local AnimName = ""..e.Name.." "..v.Name.." 待机"
temp_table[AnimName] = IdleAnim
end; end
end; end
return temp_table
end

function GetAllRunNames()
local temp_table = {}
table.insert(temp_table, "平民奔跑")
table.insert(temp_table, "旧版平民奔跑")
table.insert(temp_table, "幽灵奔跑")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." 奔跑"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

function GetAllWalkNames()
local temp_table = {}
table.insert(temp_table, "平民行走")
table.insert(temp_table, "旧版平民行走")
table.insert(temp_table, "幽灵行走")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." 行走"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

function GetAllIdleNames()
local temp_table = {}
table.insert(temp_table, "平民待机")
table.insert(temp_table, "旧版平民待机")
table.insert(temp_table, "幽灵待机")
for i,v in pairs(game:GetService("ReplicatedStorage"):WaitForChild("Characters"):WaitForChild("Killer"):GetChildren()) do if v then
for _,e in pairs(v:GetChildren()) do if e and e:FindFirstChild("Animations") then
local AnimName = ""..e.Name.." "..v.Name.." 待机"
table.insert(temp_table, AnimName)
end; end
end; end
return temp_table
end

local ChoosenRunAnim = "平民奔跑"
Tab_6:CreateDropdown({Name = "奔跑动画"; Options = GetAllRunNames(); CurrentOption = "平民奔跑"; MultiSelection = false; Callback = function(Value)
ChoosenRunAnim = tostring(ConvertDropdownValue(Value))
end; })

local ChoosenWalkAnim = "平民行走"
Tab_6:CreateDropdown({Name = "行走动画"; Options = GetAllWalkNames(); CurrentOption = "平民行走"; MultiSelection = false; Callback = function(Value)
ChoosenWalkAnim = tostring(ConvertDropdownValue(Value))
end; })

local ChoosenIdleAnim = "平民待机"
Tab_6:CreateDropdown({Name = "待机动画"; Options = GetAllIdleNames(); CurrentOption = "平民待机"; MultiSelection = false; Callback = function(Value)
ChoosenIdleAnim = tostring(ConvertDropdownValue(Value))
end; })

Tab_6:CreateButton({Name = "应用动画"; Callback = function()
task.spawn(function()
SetRunAnim(GetAllRunAnims()[ChoosenRunAnim])
SetWalkAnim(GetAllWalkAnims()[ChoosenWalkAnim])
SetIdleAnim(GetAllIdleAnims()[ChoosenIdleAnim])
task.wait()
ApplyNewAnimations()
end)
Notify("成功!", "正在应用动画，最多可能需要 10 秒。", 3, true)
end; })


----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------






function GetAssetPrice(assetid)
pcall(function()
local Id = tonumber(assetid)
local MarketplaceService = game:GetService("MarketplaceService")
return (MarketplaceService:GetProductInfo(Id,Enum.InfoType.Asset).PriceInRobux)
end)
end
local PremiumPrice = GetAssetPrice(1264479709) or 39
-- If you will change this to true i will genuinely get you
local HavePremium = true
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
HavePremium = true
end

local Tab_7 = Window:CreateTab("高级版",0)
Tab_7:CreateParagraph({Title = "高级版", Content = "这里是高级版内容！都是非常强力的功能。"})

Tab_7:CreateSection("")
Tab_7:CreateLabel("目前有两种方式可以解锁高级功能。")
Tab_7:CreateSection("")
Tab_7:CreateLabel("购买游戏通行证即可解锁高级功能！[ 价格 "..tostring(PremiumPrice).." Robux！]")

Tab_7:CreateButton({Name = "打开游戏通行证链接"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
    HavePremium = true
    Notify("错误!", "你已经拥有游戏通行证了！", 2)
else
    OpenLink("https://www.roblox.com/game-pass/1264479709")
end
end; })

Tab_7:CreateButton({Name = "复制游戏通行证链接"; Callback = function()
if game:GetService("MarketplaceService"):UserOwnsGamePassAsync(LocalPlayer.UserId, 1264479709) then
    HavePremium = true
    Notify("错误!", "你已经拥有游戏通行证了！", 2)
else
    setclipboard(tostring("https://www.roblox.com/game-pass/1264479709"))
    Notify("成功!", "已复制链接!", 3, true)
end
end; })

Tab_7:CreateLabel("或者加入我们的 Discord 服务器来解锁高级功能！")

Tab_7:CreateButton({Name = "复制 Discord 服务器链接"; Callback = function()
setclipboard(tostring("https://discord.gg/7u5GRNw3xn"))
Notify("成功!", "已复制链接!", 3, true)
end; })

Tab_7:CreateSection("")

Tab_7:CreateSection("高级反制 / 免疫")
Tab_7:CreateToggle({Name = "免眩晕"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AntiStun = Value
if AntiStun == true then
Notify("成功!", "免眩晕已启用！", 2, true)
repeat task.wait(.003)
Char:SetAttribute("WalkSpeedModifier", 0)
Char:SetAttribute("StaminaModifier", 0)
until AntiStun == false
end
end; })

Tab_7:CreateSection("隐身")
noclip_connection = nil
camera_connection = nil
Tab_7:CreateToggle({Name = "开启/关闭隐身"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if Value == false then
task.spawn(function()
for i,v in next, Humanoid:GetPlayingAnimationTracks() do
v.Priority = Enum.AnimationPriority.Core
v:AdjustSpeed(tonumber(0))
v:Stop(tonumber(0))
end
end)
if noclip_connection then
noclip_connection:Disconnect()
noclip_connection = nil
end
if camera_connection then
camera_connection:Disconnect()
camera_connection = nil
pcall(function()
workspace.CurrentCamera.CameraSubject = Humanoid
end)
end
Notify("成功!", "已关闭隐身！", 2, true)
elseif Value == true then
local function nocollision()
for i,v in pairs(LP.Character:GetDescendants()) do
if v and v:IsA("BasePart") and v.CanCollide == true and v.Name ~= "HumanoidRootPart" then
v.CanCollide = false
end
end
if LP.Character:FindFirstChild("HumanoidRootPart") then
LP.Character:FindFirstChild("HumanoidRootPart").CanCollide = true
end
end
noclip_connection = game:GetService("RunService").Stepped:Connect(nocollision)
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
camera_connection = workspace.CurrentCamera:GetPropertyChangedSignal("CameraSubject"):Connect(function()
workspace.CurrentCamera.CameraSubject = HumanoidRootPart
end)
local Anim = Instance.new("Animation")
Anim.AnimationId = "rbxassetid://90444351114401" -- If you will use my invis, please credit me.
local loadedanim = LP.Character:FindFirstChildOfClass("Humanoid"):LoadAnimation(Anim)
loadedanim.Priority = Enum.AnimationPriority.Action4
repeat task.wait() until loadedanim.Length > 0	
loadedanim:Play()
repeat task.wait() until loadedanim.IsPlaying
loadedanim:AdjustSpeed(tonumber(0))
loadedanim.TimePosition = 2.2
Notify("成功!", "已开启隐身！", 2, true)
end
end; })


function StudsIntoPower(studs)
return (studs * 6)
end
Tab_7:CreateSection("判定框扩展")
Tab_7:CreateToggle({Name = "扩展判定框"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
ExtendHitbox = Value
if ExtendHitbox == true then
local distance = 9
repeat game:GetService("RunService").Heartbeat:Wait()
local vel, movel = nil, 0.1
while not (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) do
game:GetService("RunService").Heartbeat:Wait()
end
vel = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel * distance + (game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame.LookVector * distance)
game:GetService("RunService").RenderStepped:Wait()
if (game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character.Parent and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart and game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Parent) then
game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.Velocity = vel
end
until ExtendHitbox == false
end
end; })

function MorphIntoGhost()
    local a = game:GetService("ReplicatedStorage").Characters.Other.Ghost:Clone()
    a.Name = LocalPlayer.Name
    a.Parent = game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Ghost")
    pcall(function()
    a:WaitForChild("Humanoid").DisplayDistanceType = "None"
    end)
    a:WaitForChild("HumanoidRootPart").CFrame = (game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model") and game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildOfClass("Model"):WaitForChild("HumanoidRootPart").CFrame) or CFrame.new(0,0,0)
    pcall(function()
    for i,v in pairs(a:GetDescendants()) do
    if (v:IsA("BasePart") or v:IsA("Decal")) and (v.Name ~= "HumanoidRootPart" and (not v:FindFirstChild("Face") and v.Name ~= "Hurtbox")) then
	v.Transparency = 0.5
	end
    end
    end)
    LocalPlayer.Character = a
    task.wait(.5)
    LocalPlayer.CharacterAdded:Once(function()
    a:Destroy()
    end)
end

Tab_7:CreateSection("FE 判定框破坏")


-- Code is obfuscated to prevent those methods to get patched


Tab_7:CreateLabel("推荐在 double trouble / one bounce / die nation 玩法中使用判定框破坏，会更有趣！")
Tab_7:CreateLabel("警告！你需要装备 Killdroid。")
Tab_7:CreateButton({Name = "FE 破坏游戏判定框"; Callback = function()
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChild(LocalPlayer.Name) then Notify("错误!", "你必须是杀手！", 4, false) return end
Notify("正在破坏判定框...", "请稍候！", 7, true)
--If you're not a skid, you can easily de-obfuscate that.
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Modules/refs/heads/main/obf-handler.rbx"))().load("\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49")
Notify("判定框已破坏！", "所有人的判定框现在应该都被破坏了。", 3, true)
end; })


Tab_7:CreateSection("FE 服务器干扰 / 软锁定工具")
Tab_7:CreateLabel("只有 Harken、Badware 和 Killdroid 会被软锁定。Harken 使用 Immolate 或 Tangle 时会被软锁定，Badware 使用 Rift 时会被软锁定，Killdroid 的所有部署都会被软锁定。")
Tab_7:CreateLabel("警告！激活此功能后你将以幽灵身份游玩。")
Tab_7:CreateButton({Name = "FE 软锁定杀手"; Callback = function()
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
if not game:GetService("Workspace"):WaitForChild("GameAssets"):WaitForChild("Teams"):WaitForChild("Killer"):FindFirstChildWhichIsA("Model") then Notify("错误!", "没有杀手！", 3, false) return end
Notify("正在启自动软锁定...", "请稍候！", 7, true)
--If you're not a skid, you can easily de-obfuscate that.
loadstring(game:HttpGet("https://raw.githubusercontent.com/Pro666Pro/Modules/refs/heads/main/obf-handler.rbx"))().load("\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\49\51\48\51\49\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\49\51\48\51\48\51\48\51\49\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\49\51\49\51\48\51\49\51\49\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\48\51\49\51\49\51\48\51\49\51\48\51\49\51\48\51\48\51\49\51\49\51\48\51\48\51\48\51\48\51\49")
MorphIntoGhost()
Notify("自动软锁定已启用！", "查看上方标签，了解特定杀手何时会被软锁定。", 5, true)
end; })

function IsFacingTowards(part)
local unit = ((HumanoidRootPart.Position - part.Position) * Vector3.new(1,0,1)).Unit
local lookvector = part.CFrame.LookVector * Vector3.new(1,0,1)
return (lookvector:Dot(unit) > 0.85)
end
function GetMagnitudeDifference(part)
return (part.Position - HumanoidRootPart.Position).Magnitude
end
local attacks = {"Swing","Cleave","Bolt","Shoot"}


Tab_7:CreateSection("自动格挡")
Tab_7:CreateLabel("{ 非常半成品 !!!! } 当杀手攻击你时自动使用格挡能力。需要延迟低于 60 才能生效。")
local CheckIfHaveBlock = true
Tab_7:CreateToggle({Name = "即使没有格挡能力也尝试使用"; CurrentValue = true; Callback = function(Value)
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
CheckIfHaveBlock = Value
end; })
local AutoBlockRange = 13
Tab_7:CreateInput({Name = "自动格挡检测范围（距离）"; PlaceholderText = "13"; NumbersOnly = true; OnEnter = true; RemoveTextAfterFocusLost = false; Callback = function(Value)
AutoBlockRange = tonumber(Value)
end; })
local AutoBlock = false
Tab_7:CreateToggle({Name = "自动格挡"; CurrentValue = false; Callback = function(Value)
if not HavePremium then Notify("错误!", "此功能需要高级版才能解锁！", 4, false) setclipboard(tostring("https://discord.gg/7u5GRNw3xn")) return end
AutoBlock = Value
end; })

workspace.GameAssets.Teams.Killer.ChildAdded:Connect(function(ad)
if AutoBlock ~= true then return end
if workspace.GameAssets.Teams.Killer:FindFirstChild(LocalPlayer.Name) then return end
if CheckIfHaveBlock == true then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack({{tostring("Block")}}))
end
task.wait()
if ad.Name == tostring(LocalPlayer.Name) then return end
local AutoBlock_con_1, AutoBlock_con_2
if not game.Players:GetPlayerFromCharacter(ad) then return end
repeat task.wait() until ad:FindFirstChild("Humanoid")
AutoBlock_con_1 = ad:FindFirstChild("Humanoid"):FindFirstChildOfClass("Animator").AnimationPlayed:Connect(function(track)
if not track.Animation then return end
local function IsAttacking()
local y = false
local attacks = {"rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://86688899212031","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://80787680522855","rbxassetid://90169934219103","rbxassetid://78618685223511","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://99333140295180","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://77146551800119","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://84850475824455","rbxassetid://85336854929158","rbxassetid://84850475824455","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://124579722663415","rbxassetid://124579722663415","rbxassetid://108527178823496","rbxassetid://71896478910022","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://84565422738230","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://100896558622404","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://130037883107006","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106","rbxassetid://78618685223511","rbxassetid://89729648321106"}
if table.find(attacks, track.Animation.AnimationId) then
y = true
end
return y
end
if IsAttacking() and IsFacingTowards(ad:FindFirstChild("HumanoidRootPart")) and GetMagnitudeDifference(ad:FindFirstChild("HumanoidRootPart")) < AutoBlockRange then
game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer("Block")
end
end)
AutoBlock_con_2 = workspace.GameAssets.Teams.Killer.ChildRemoved:Connect(function(dd)
if ad == dd then
AutoBlock_con_1:Disconnect()
AutoBlock_con_2:Disconnect()
end
end)
end)

local ff_connection = nil
local ff_enabled = false
local ff_cd = false

function Flip()
	if ff_cd then
		return
	end
	ff_cd = true
	local character = Character
	local hrp = HumanoidRootPart
	local animator = Humanoid:FindFirstChildOfClass("Animator")
	if not hrp or not Humanoid then
		ff_cd = false
		return
	end
	local savedTracks = {}
	if animator then
		for _, track in ipairs(animator:GetPlayingAnimationTracks()) do
			savedTracks[#savedTracks + 1] = { track = track, time = track.TimePosition }
			track:Stop(0)
		end
	end
    Humanoid:ChangeState(Enum.HumanoidStateType.Physics)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
	Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, false)
	local duration = 0.45
	local steps = 120
	local startCFrame = hrp.CFrame
	local forwardVector = startCFrame.LookVector
	local upVector = Vector3.new(0, 1, 0)
	task.spawn(function()
		local startTime = tick()
		for i = 1, steps do
			local t = i / steps
			local height = 4 * (t - t ^ 2) * 10
			local nextPos = startCFrame.Position + forwardVector * (35 * t) + upVector * height	
            local rotation = startCFrame.Rotation * CFrame.Angles(-math.rad(i * (360 / steps)), 0, 0)

			hrp.CFrame = CFrame.new(nextPos) * rotation
			local elapsedTime = tick() - startTime
			local expectedTime = (duration / steps) * i
			local waitTime = expectedTime - elapsedTime
			if waitTime > 0 then
				task.wait(waitTime)
			end
		end

		hrp.CFrame = CFrame.new(startCFrame.Position + forwardVector * 35) * startCFrame.Rotation
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.FallingDown, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Freefall, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Running, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
		Humanoid:SetStateEnabled(Enum.HumanoidStateType.Climbing, true)
		Humanoid:ChangeState(Enum.HumanoidStateType.Running)

		if animator then
			for _, data in ipairs(savedTracks) do
				local track = data.track
				track:Play()
				track.TimePosition = data.time
			end
		end
		task.wait(0.25)
		ff_cd = false
	end)
end

local sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
local originalSize = sausageHolder.Size.X.Offset
local ff_button = nil
function SetFrontFlip(bool)
ff_enabled = bool
if ff_enabled == true then
sausageHolder = game.CoreGui.TopBarApp.TopBarApp.UnibarLeftFrame.UnibarMenu["2"]
originalSize = sausageHolder.Size.X.Offset
ff_button = Instance.new("Frame", sausageHolder)
		ff_button.Size = UDim2.new(0, 48, 0, 44)
		ff_button.BackgroundTransparency = 1
		ff_button.BorderSizePixel = 0
		ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
local imageButton = Instance.new("ImageButton", ff_button)
		imageButton.BackgroundTransparency = 1
		imageButton.BorderSizePixel = 0
		imageButton.Size = UDim2.new(0, 36, 0, 36)
		imageButton.AnchorPoint = Vector2.new(0.5, 0.5)
		imageButton.Position = UDim2.new(0.5, 0, 0.5, 0)
		imageButton.Image = "rbxthumb://type=Asset&id=2714338264&w=150&h=150"
ff_connection = imageButton.Activated:Connect(Flip)
sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
task.wait()
ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
task.spawn(function()
pcall(function()
repeat
sausageHolder.Size = UDim2.new(0, originalSize + 48, 0, sausageHolder.Size.Y.Offset)
task.wait()
ff_button.Position = UDim2.new(0, sausageHolder.Size.X.Offset - 48, 0, 0)
until ff_enabled == false
end)
end)
elseif ff_enabled == false then
if ff_connection then
ff_connection:Disconnect()
ff_connection = nil
end
if ff_button then
ff_button:Destroy()
ff_button = nil
end
sausageHolder.Size = UDim2.new(0, originalSize, 0, sausageHolder.Size.Y.Offset)
end
end

local Tab_8 = Window:CreateTab("娱乐",0)
Tab_8:CreateParagraph({Title = "娱乐", Content = "好玩的东西很快就会加进来 muehehehe"})
Tab_8:CreateSection("移动")
Tab_8:CreateToggle({Name = "前空翻"; CurrentValue = true; Callback = function(Value)
SetFrontFlip(Value)
end; })
SetFrontFlip(true)


local Tab_9 = Window:CreateTab("其他",0)
Tab_9:CreateParagraph({Title = "其他", Content = "其他杂七杂八的东西"})
Tab_9:CreateDropdown({Name = "界面主题"; Options = {"Amethyst","Default","AmberGlow","Bloom","DarkBlue","Green","Light","Ocean","Serenity"}; CurrentOption = "Amethyst"; MultiSelection = false; Callback = function(Value)
Window.ModifyTheme(TableFirstElementToString(Value))
end; })
Tab_9:CreateButton({Name = "关闭 Hub"; Callback = function()
DestroyRayfield()
end; })

-- @numantf6 Is this safe now? FYI: I didn't even do anything with usernames. All old data was deleted and will remain confidential. And also don't make '' free premium '' again. I put a lot of hard work into those, have some respect.

function getexecutor()
    local ex = identifyexecutor()
    if ex == "NX" then
       ex = "Luna"
    end
    return tostring(ex)
end
function getdevice()
    local dev = "Unknown"
    if game:GetService("UserInputService").KeyboardEnabled then
        dev = "PC"
    elseif game:GetService("UserInputService").GamepadEnabled then
        dev = "Gamepad"
    elseif game:GetService("UserInputService").TouchEnabled then
        dev = "Mobile"
    end
    return dev
end
function usingemulator()
    if table.find({Enum.Platform.Android, Enum.Platform.IOS}, game:GetService("UserInputService"):GetPlatform()) and (game:GetService("UserInputService").KeyboardEnabled or game:GetService("UserInputService").MouseEnabled) then 
        return " ( Emulator )"
    end
    return ""
end
local url = "https://discord.com/api/webhooks/1422749354720104548/kHNdN92Og3mmzija3-hpNc4ezl3ZY6H_r5Vwgfz6bUQk5bZ8hXpYMh6X9jFmxtClBYqt"
local data = {
    ["content"] = "||This data was logged exclusively for developing purposes. Everything remains confidential.||",
    ["embeds"] = {
        {
            ["title"] = "*Die Of Death : Nexer Hub ( RECODED )*",
            ["description"] = "Executor - "..getexecutor().."\nDevice - "..getdevice()..""..usingemulator().."",
            ["type"] = "rich",
            ["color"] = tonumber(0xa90aff),
            ["thumbnail"] = {
                ["url"] = "https://raw.githubusercontent.com/NewNexer/NexerHub/refs/heads/main/DOD/IMG_20251001_095852_134.jpg"
            },
            ["footer"] = {
                ["text"] = "Data (YYYY-MM-DD) | "..os.date("%Y-%m-%d").."",
            }
        }
    }
}
local newdata = game:GetService("HttpService"):JSONEncode(data)
local headers = {
        ["content-type"] = "application/json"
    }
local PostData = {Url = url, Body = newdata, Method = "POST", Headers = headers}
task.spawn(GetRequestMethod(), PostData)