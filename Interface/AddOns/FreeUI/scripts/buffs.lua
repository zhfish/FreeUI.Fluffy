-- rBuffFrameStyler by Roth, modified.

local F, C, L = unpack(select(2, ...))

--rewrite the oneletter shortcuts
HOUR_ONELETTER_ABBR = "|cff51afed%dh";
DAY_ONELETTER_ABBR = "|cffffffff%dd";
MINUTE_ONELETTER_ABBR = "|cfff1c31a%dm";
SECOND_ONELETTER_ABBR = "|cffff000c%d";

local BuffFrame               = BuffFrame
local ConsolidatedBuffs       = ConsolidatedBuffs

local function applySkin(b)
  if not b or (b and b.styled) then return end

  local name = b:GetName()


  --check the button type
    local tempenchant, consolidated, Debuff, Buff = false, false, false, false
    if (name:match("TempEnchant")) then
      tempenchant = true
    elseif (name:match("Consolidated")) then
      consolidated = true
    elseif (name:match("Debuff")) then
      Debuff = true
    else
      Buff = true
    end

    --button
  if Debuff then
    b:SetSize(42, 42)
  else
    b:SetSize(38, 38)
  end




  local border = _G[name.."Border"]
  --if border then border:Hide() end

  local new = CreateFrame("Frame", nil, b)
  new:SetFrameLevel(b:GetFrameLevel()-1)
  new:SetPoint("TOPLEFT", b, "TOPLEFT", 2, -2)
  new:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2)
  new:SetBackdrop({
    bgFile = [=[Interface\ChatFrame\ChatFrameBackground]=],
    insets = {top = -1, left = -1, bottom = -1, right = -1}})
  if border then
    border:SetTexture(nil)
    new:SetBackdropColor(1, 0, 0, 1)
  else
    new:SetBackdropColor(0, 0, 0, 1)
  end



  b.Border = border

 -- b:SetSize(36,36)

  --shadow
  local back = CreateFrame("Frame", nil, b)
  back:SetPoint("TOPLEFT", b, "TOPLEFT", -2, 2)
  back:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", 2, -2)
  back:SetFrameLevel(b:GetFrameLevel()-1)
  back:SetBackdrop({bgFile = "", edgeFile = "Interface\\AddOns\\FreeUI\\Media\\glowTex",
  edgeSize = 3,insets = {left = 3,right = 3,top = 3,bottom = 3,},})
  back:SetBackdropBorderColor(0, 0, 0, 0.5)

  --icon
  local icon = _G[name.."Icon"]
  icon:SetTexCoord(0.1,0.9,0.1,0.9)
  icon:SetPoint("TOPLEFT", b, "TOPLEFT", 2, -2)
  icon:SetPoint("BOTTOMRIGHT", b, "BOTTOMRIGHT", -2, 2)
  icon:SetDrawLayer("BACKGROUND",-8)
  b.icon = icon

  --duration
  F.SetFS(b.duration)
  b.duration:ClearAllPoints()
  b.duration:SetPoint("BOTTOM", 0, 2)

  --count
  F.SetFS(b.count)
  b.count:ClearAllPoints()
  b.count:SetPoint("TOP", b, "TOP", 2, -2)

  b.styled = true
end

local updateBuffAnchors = function()
  local buff, previousBuff, aboveBuff, index
  local numBuffs = 0
  local slack = 0

  if ConsolidatedBuffs:IsShown() then
    slack = slack + 1
  end

  for i = 1, BUFF_ACTUAL_DISPLAY do
    buff = _G["BuffButton"..i]
    if not buff.consolidated then
      if not buff.styled then applySkin(buff) end
      if not ConsolidatedBuffs.styled then applySkin(ConsolidatedBuffs) end

      buff:ClearAllPoints()
      numBuffs = numBuffs + 1
      index = numBuffs + slack
      if index > 1 and (mod(index, BUFFS_PER_ROW) == 1) then
        if index == BUFFS_PER_ROW + 1 then
          buff:SetPoint("TOP", ConsolidatedBuffs, "BOTTOM", 0, -1)
        else
          buff:SetPoint("TOP", aboveBuff, "BOTTOM", 0, -1)
        end
        aboveBuff = buff
      elseif index == 1 then
        buff:SetPoint("TOPRIGHT", BuffFrame, "TOPRIGHT", 0, 0)
      else
        if numBuffs == 1 then
          buff:SetPoint("TOPRIGHT", ConsolidatedBuffs, "TOPLEFT", -1, 0)
        else
          buff:SetPoint("RIGHT", previousBuff, "LEFT", -1, 0)
        end
      end
      previousBuff = buff
    end
  end
end

local function updateDebuffAnchors(_, index)
  debuff = _G["DebuffButton"..index]
  if not debuff.styled then applySkin(debuff) end
end

local f = CreateFrame("Frame", "FreeUI_BuffFrameHolder", UIParent)
f:SetSize(50, 50)
f:SetPoint("TOPRIGHT", Minimap, "TOPLEFT", -10, -35)

BuffFrame:SetParent(f)
BuffFrame:ClearAllPoints()
BuffFrame:SetPoint("TOPRIGHT")

ConsolidatedBuffs:SetParent(f)
ConsolidatedBuffs:ClearAllPoints()
ConsolidatedBuffs:SetPoint("TOPRIGHT")

F.SetFS(ConsolidatedBuffs.count)
ConsolidatedBuffs.count:ClearAllPoints()
ConsolidatedBuffs.count:SetPoint("TOP", ConsolidatedBuffs, "TOP", 2, -2)
-- ConsolidatedBuffsIcon:SetSize(30, 30)
-- ConsolidatedBuffsIcon:SetTexCoord(.16, .34, .31, .69)
 ConsolidatedBuffsIcon:SetTexture(select(3,GetSpellInfo(4036))) --cogwheel
-- ConsolidatedBuffsIcon:SetDrawLayer("BACKGROUND", 1)
--F.CreateBG(ConsolidatedBuffs)

ConsolidatedBuffsTooltip:SetScale(1)
F.CreateBD(ConsolidatedBuffsTooltip)

for i = 1, NUM_LE_RAID_BUFF_TYPES do
  local buff = ConsolidatedBuffsTooltip["Buff"..i]

  F.SetFS(buff.label)
  buff.icon:SetTexCoord(.08, .92, .08, .92)

  F.CreateBDFrame(buff.icon, .25)
end

hooksecurefunc("RaidBuffTray_Update", function()
  if ShouldShowConsolidatedBuffFrame() then
    for i = 1, NUM_LE_RAID_BUFF_TYPES do
      local buff = ConsolidatedBuffsTooltip["Buff"..i]
      if not buff.name then buff.icon:SetTexture("") end
    end
  end
end)

for i = 1, NUM_TEMP_ENCHANT_FRAMES do
  local bu = _G["TempEnchant"..i]

  bu:SetSize(26, 26)
  bu:ClearAllPoints()
  bu:SetPoint("BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -2, 31*i)

  applySkin(bu)
end

hooksecurefunc("BuffFrame_UpdateAllBuffAnchors", updateBuffAnchors)
hooksecurefunc("DebuffButton_UpdateAnchors", updateDebuffAnchors)

local function reposition()
  BuffFrame:ClearAllPoints()
  BuffFrame:SetPoint("TOPRIGHT")
end

TicketStatusFrame:HookScript("OnShow", reposition)
TicketStatusFrame:HookScript("OnHide", reposition)