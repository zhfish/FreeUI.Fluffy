
---------------------------------------
-- VARIABLES
---------------------------------------

--get the addon namespace
local addon, ns = ...
local cfg = ns.cfg

--backdrop
local backdrop = {
    bgFile = "Interface\\ChatFrame\\ChatFrameBackground",
    edgeFile = "Interface\\AddOns\\FreeUI\\Media\\glowTex", edgeSize = 3,
    insets = {left = 3, right = 3, top = 3, bottom = 3}
}

---------------------------------------
-- FUNCTIONS
---------------------------------------

local function applyBackground(bu)
    if not bu or (bu and bu.bg) then return end
    --shadows+background
    if bu:GetFrameLevel() < 1 then bu:SetFrameLevel(1) end
    bu.bg = CreateFrame("Frame", nil, bu)
    bu.bg:SetAllPoints(bu)
    bu.bg:SetPoint("TOPLEFT", bu, "TOPLEFT", -2, 2)
    bu.bg:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", 2, -2)
    bu.bg:SetFrameLevel(bu:GetFrameLevel()-1)
    bu.bg:SetBackdrop(backdrop)
    bu.bg:SetBackdropColor(0.05, 0.05, 0.05, 1)
    bu.bg:SetBackdropBorderColor(0, 0, 0, .6)
end

local function SetCheckedTexture(self)
    self:SetTexture("Interface\\Addons\\FreeUI\\Media\\CheckButtonHilight")
    self:SetVertexColor(.5, 1, .5)
    self:SetPoint("TOPLEFT")
    self:SetPoint("BOTTOMRIGHT")
end

local function SetHighlightTexture(self)
    self:SetTexture([=[Interface\Buttons\WHITE8x8]=])
    self:SetVertexColor(1,1,1,.2)
    self:SetPoint("TOPLEFT", 2, -2)
    self:SetPoint("BOTTOMRIGHT", -2, 2)
end

local function SetNormalTexture(self)
    self:SetTexture(nil)
end

--style extraactionbutton
local function styleExtraActionButton(bu)
    if not bu or (bu and bu.rabs_styled) then return end
    local name = bu:GetName()
    local ho = _G[name.."HotKey"]
    --remove the style background theme
    bu.style:SetTexture(nil)
    hooksecurefunc(bu.style, "SetTexture", function(self, texture)
        if texture then
            --print("reseting texture: "..texture)
            self:SetTexture(nil)
        end
    end)
    SetHighlightTexture(bu:GetHighlightTexture())
    bu:SetPushedTexture(nil)
    bu:SetCheckedTexture(nil)
    --icon
    bu.icon:SetTexCoord(0.1,0.9,0.1,0.9)
    bu.icon:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
    bu.icon:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
    --cooldown
    bu.cooldown:SetAllPoints(bu.icon)
    --hotkey
    ho:Hide()
    --add button normaltexture
    SetNormalTexture(bu:GetNormalTexture())
    --apply background
    if not bu.bg then applyBackground(bu) end
    bu.rabs_styled = true
end

--initial style func
local function styleActionButton(bu)
    if not bu or (bu and bu.rabs_styled) then
        return
    end
    local action = bu.action
    local name = bu:GetName()
    local ic  = _G[name.."Icon"]
    local co  = _G[name.."Count"]
    local bo  = _G[name.."Border"]
    local ho  = _G[name.."HotKey"]
    local cd  = _G[name.."Cooldown"]
    local na  = _G[name.."Name"]
    local fl  = _G[name.."Flash"]
    local nt  = _G[name.."NormalTexture"]
    local fbg  = _G[name.."FloatingBG"]
    local fob = _G[name.."FlyoutBorder"]
    local fobs = _G[name.."FlyoutBorderShadow"]
    if fbg then fbg:Hide() end  --floating background
    --flyout border stuff
    if fob then fob:SetTexture(nil) end
    if fobs then fobs:SetTexture(nil) end
    bo:SetTexture(nil) --hide the border (plain ugly, sry blizz)
    --hotkey
    ho:SetFont(cfg.font, 8, "Outlinemonochrome")
    ho:ClearAllPoints()
    ho:SetPoint("TOPRIGHT",bu)
    ho:SetPoint("TOPLEFT",bu)

    local text = ho:GetText()

    if text then
        text = text:gsub("(s%-)", "S")
        text = text:gsub("(a%-)", "A")
        text = text:gsub("(c%-)", "C")
        if locale == "zhCN" then
            text = text:gsub("鼠标按键", "M")
            text = text:gsub("鼠标中键", "M3")
            text = text:gsub("鼠标滚轮向上滚动", "MU")
            text = text:gsub("鼠标滚轮向下滚动", "MD")
        end
        text = text:gsub("Mouse Button", "M")
        text = text:gsub("Middle Mouse", "M3")
        text = text:gsub("Mouse Wheel Up", "MU")
        text = text:gsub("Mouse Wheel Down", "MD")
        text = text:gsub("Delete", "Del")
        text = text:gsub("Num Pad", "N")
        text = text:gsub("Page Up", "PU")
        text = text:gsub("Page Down", "PD")
        text = text:gsub("Spacebar", "SpB")
        text = text:gsub("Insert", "Ins")
        text = text:gsub("Num Lock", "NL")
        text = text:gsub("Home", "Hm")

        ho:SetText("|cffffffff"..text)
    end

    if not cfg.hotkeys then
        ho:Hide()
    end
    --macro name
    na:SetFont(cfg.font, 8, "Outlinemonochrome")
    na:ClearAllPoints()
    na:SetPoint("BOTTOMLEFT",bu)
    na:SetPoint("BOTTOMRIGHT",bu)
    if not cfg.macroname then na:Hide() end
    --item stack count
    co:SetFont(cfg.font, 8, "Outlinemonochrome")
    --applying the textures
    fl:SetTexture(nil)
    SetHighlightTexture(bu:GetHighlightTexture())
    SetCheckedTexture(bu:GetCheckedTexture())
    SetNormalTexture(bu:GetNormalTexture())
    bu:SetPushedTexture(nil)
    if not nt then
        --fix the non existent texture problem (no clue what is causing this)
        nt = bu:GetNormalTexture()
    end
    --cut the default border of the icons and make them shiny
    ic:SetTexCoord(0.1,0.9,0.1,0.9)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
    --adjust the cooldown frame
    cd:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
    cd:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2,2)
    --shadows+background
    if not bu.bg then applyBackground(bu) end
    bu.rabs_styled = true
end

local function styleLeaveButton(bu)
    if not bu or (bu and bu.rabs_styled) then return end
    --shadows+background
    if not bu.bg then applyBackground(bu) end
    bu.rabs_styled = true
end

--style pet buttons
local function stylePetButton(bu)
    if not bu or (bu and bu.rabs_styled) then return end
    local name = bu:GetName()
    local ic  = _G[name.."Icon"]
    local fl  = _G[name.."Flash"]
    local ho  = _G[name.."HotKey"]
    local cd  = _G[name.."Cooldown"]
    local nt  = _G[name.."NormalTexture2"]
    --setting the textures
    fl:SetTexture("")
    bu:SetPushedTexture("")
    bu:SetNormalTexture("")
    bu:SetHighlightTexture("")
    bu:SetCheckedTexture("Interface\\Addons\\FreeUI\\Media\\CheckButtonHilight")
    hooksecurefunc(bu, "SetNormalTexture", function(self, texture)
        if texture then
            self:SetNormalTexture(nil)
        end
    end)
    ho:SetFont(cfg.font, 8, "Outlinemonochrome")
    ho:ClearAllPoints()
    ho:SetPoint("TOPRIGHT",bu)
    ho:SetPoint("TOPLEFT",bu)
    if not cfg.hotkeys then
        ho:Hide()
    end
    --cut the default border of the icons and make them shiny
    ic:SetTexCoord(0.1,0.9,0.1,0.9)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
    --shadows+background
    if not bu.bg then applyBackground(bu) end
    bu.rabs_styled = true
end

--style stance buttons
local function styleStanceButton(bu)
    if not bu or (bu and bu.rabs_styled) then return end
    local name = bu:GetName()
    local ic  = _G[name.."Icon"]
    local fl  = _G[name.."Flash"]
    local nt  = _G[name.."NormalTexture2"]
    --setting the textures
    fl:SetTexture(nil)
    bu:SetPushedTexture(nil)
    SetNormalTexture(bu:GetNormalTexture())
    SetHighlightTexture(bu:GetHighlightTexture())
    SetCheckedTexture(bu:GetCheckedTexture())
    --cut the default border of the icons and make them shiny
    ic:SetTexCoord(0.1,0.9,0.1,0.9)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
    --shadows+background
    if not bu.bg then applyBackground(bu) end
    bu.rabs_styled = true
end

--style possess buttons
local function stylePossessButton(bu)
    if not bu or (bu and bu.rabs_styled) then return end
    local name = bu:GetName()
    local ic  = _G[name.."Icon"]
    local fl  = _G[name.."Flash"]
    local nt  = _G[name.."NormalTexture"]
    nt:SetAllPoints(bu)
    --setting the textures
    fl:SetTexture(nil)
    bu:SetPushedTexture(nil)
    SetNormalTexture(bu:GetNormalTexture())
    SetHighlightTexture(bu:GetHighlightTexture())
    SetCheckedTexture(bu:GetCheckedTexture())
    --cut the default border of the icons and make them shiny
    ic:SetTexCoord(0.1,0.9,0.1,0.9)
    ic:SetPoint("TOPLEFT", bu, "TOPLEFT", 2, -2)
    ic:SetPoint("BOTTOMRIGHT", bu, "BOTTOMRIGHT", -2, 2)
    --shadows+background
    if not bu.bg then applyBackground(bu) end
    bu.rabs_styled = true
end

--update hotkey func
local function updateHotkey(self, actionButtonType)
    local ho = _G[self:GetName().."HotKey"]
    if ho and not cfg.hotkeys and ho:IsShown() then
        ho:Hide()
    end
end

---------------------------------------
-- INIT
---------------------------------------

local function init()
    --style the actionbar buttons
    for i = 1, NUM_ACTIONBAR_BUTTONS do
        styleActionButton(_G["ActionButton"..i])
        styleActionButton(_G["MultiBarBottomLeftButton"..i])
        styleActionButton(_G["MultiBarBottomRightButton"..i])
        styleActionButton(_G["MultiBarRightButton"..i])
        styleActionButton(_G["MultiBarLeftButton"..i])
    end
    for i = 1, 6 do
        styleActionButton(_G["OverrideActionBarButton"..i])
    end
    --style leave button
    styleLeaveButton(OverrideActionBarLeaveFrameLeaveButton)
    styleLeaveButton(rABS_LeaveVehicleButton)
    --petbar buttons
    for i=1, NUM_PET_ACTION_SLOTS do
        stylePetButton(_G["PetActionButton"..i])
    end
    --stancebar buttons
    for i=1, NUM_STANCE_SLOTS do
        styleStanceButton(_G["StanceButton"..i])
    end
    --possess buttons
    for i=1, NUM_POSSESS_SLOTS do
        stylePossessButton(_G["PossessButton"..i])
    end
    --extraactionbutton1
    styleExtraActionButton(ExtraActionButton1)
    --spell flyout
    SpellFlyoutBackgroundEnd:SetTexture(nil)
    SpellFlyoutHorizontalBackground:SetTexture(nil)
    SpellFlyoutVerticalBackground:SetTexture(nil)
    local function checkForFlyoutButtons(self)
        local NUM_FLYOUT_BUTTONS = 10
        for i = 1, NUM_FLYOUT_BUTTONS do
            styleActionButton(_G["SpellFlyoutButton"..i])
        end
    end
    SpellFlyout:HookScript("OnShow",checkForFlyoutButtons)

    --hide the hotkeys if needed
    if not cfg.hotkeys then
        hooksecurefunc("ActionButton_UpdateHotkeys",  updateHotkey)
    end

end

---------------------------------------
-- CALL
---------------------------------------

local a = CreateFrame("Frame")
a:RegisterEvent("PLAYER_LOGIN")
a:SetScript("OnEvent", init)
