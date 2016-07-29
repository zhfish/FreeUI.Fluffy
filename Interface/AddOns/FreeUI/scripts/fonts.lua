local F, C, L = unpack(select(2, ...))

local playername, _ = UnitName('player')
local locale = GetLocale()

local fontStandard
local fontUnitName
local fontDiablo
local fontDamage

if locale == "zhCN" then
	fontStandard = "Fonts\\ARKai_T.ttf"		-- 简体中文客户端主字体
	fontUnitName = "Fonts\\ARKai_T.TTF"		-- 玩家 / NPC 头上的名字
	fontDiablo = 'Fonts\\ARKai_T.TTF'		-- 地图上的地名字体
	fontDamage = 'Fonts\\ARKai_T.TTF'		-- 伤害字体
else
	fontStandard = C.media.font2
	fontUnitName = C.media.font2
	fontDiablo = 'Interface\\Addons\\FreeUI\\media\\ExocetBlizzardMedium.ttf'
	fontDamage = 'Interface\\Addons\\FreeUI\\media\\PEPSI_pl.ttf'
end

RaidWarningFrame.slot1:SetFont(fontStandard, 20, "OUTLINE")
RaidWarningFrame.slot2:SetFont(fontStandard, 20, "OUTLINE")
RaidBossEmoteFrame.slot1:SetFont(fontStandard, 20, "OUTLINE")
RaidBossEmoteFrame.slot2:SetFont(fontStandard, 20, "OUTLINE")

F.SetFS(UIErrorsFrame)

STANDARD_TEXT_FONT = fontStandard
UNIT_NAME_FONT     = fontUnitName
DAMAGE_TEXT_FONT   = fontDamage

UIDROPDOWNMENU_DEFAULT_TEXT_HEIGHT = 12
CHAT_FONT_HEIGHTS = {11, 12, 13, 14, 15, 16, 17, 18, 19, 20}

AchievementFont_Small:SetFont(fontStandard, 12) -- 成就日期
AchievementFont_Small:SetShadowColor(0, 0, 0)
AchievementFont_Small:SetShadowOffset(1, -1)

CoreAbilityFont:SetFont(fontStandard, 32) -- 核心技能面板大字体
CoreAbilityFont:SetShadowColor(0, 0, 0)
CoreAbilityFont:SetShadowOffset(1, -1)

DestinyFontHuge:SetFont(fontStandard, 32)
DestinyFontHuge:SetShadowColor(0, 0, 0)
DestinyFontHuge:SetShadowOffset(1, -1)
DestinyFontLarge:SetFont(fontStandard, 18)
DestinyFontLarge:SetShadowColor(0, 0, 0)
DestinyFontLarge:SetShadowOffset(1, -1)

FriendsFont_Normal:SetFont(fontStandard, 13) -- 好友名字
FriendsFont_Small:SetFont(fontStandard, 11) -- 好友位置
FriendsFont_Large:SetFont(fontStandard, 14)
FriendsFont_UserText:SetFont(fontStandard, 11) -- 好友战网更新

GameFont_Gigantic:SetFont(fontStandard, 32)
GameTooltipHeader:SetFont(fontStandard, 14) -- tooltip 头部
GameTooltipHeader:SetShadowColor(0, 0, 0)
GameTooltipHeader:SetShadowOffset(1, -1)

Tooltip_Med:SetFont(fontStandard, 12)
Tooltip_Med:SetShadowColor(0, 0, 0)
Tooltip_Med:SetShadowOffset(1, -1)
Tooltip_Small:SetFont(fontStandard, 10)
Tooltip_Small:SetShadowColor(0, 0, 0)
Tooltip_Small:SetShadowOffset(1, -1)

InvoiceFont_Small:SetFont(fontStandard, 10)
InvoiceFont_Small:SetShadowColor(0, 0, 0)
InvoiceFont_Small:SetShadowOffset(1, -1)
InvoiceFont_Med:SetFont(fontStandard, 12)
InvoiceFont_Med:SetShadowColor(0, 0, 0)
InvoiceFont_Med:SetShadowOffset(1, -1)

MailFont_Large:SetFont(fontStandard, 15) -- 邮件内容

NumberFont_GameNormal:SetFont(fontStandard, 10)
NumberFont_OutlineThick_Mono_Small:SetFont(fontStandard, 12, "OUTLINE")
NumberFont_Outline_Huge:SetFont(fontStandard, 30, "OUTLINE")
NumberFont_Outline_Large:SetFont(fontStandard, 16, "OUTLINE")
NumberFont_Outline_Med:SetFont(fontStandard, 14, "OUTLINE")
NumberFont_Shadow_Med:SetFont(fontStandard, 14)
NumberFont_Shadow_Small:SetFont(fontStandard, 12)

QuestFont_Shadow_Small:SetFont(fontStandard, 15)
QuestFont_Large:SetFont(fontStandard, 17)
QuestFont_Large:SetShadowColor(0, 0, 0)
QuestFont_Large:SetShadowOffset(1, -1)
QuestFont_Shadow_Huge:SetFont(fontDiablo, 24) -- 任务标题/地下城任务标题
QuestFont_Huge:SetFont(fontStandard, 18) -- rewards
QuestFont_Super_Huge:SetFont(fontStandard, 24)
QuestFont_Super_Huge:SetShadowColor(0, 0, 0)
QuestFont_Super_Huge:SetShadowOffset(1, -1)

if locale ~= "zhCN" and locale ~= "zhTW" then -- I don't even know
	QuestFont_Enormous:SetFont(fontStandard, 30)
	QuestFont_Enormous:SetShadowOffset(1, -1)
end

ReputationDetailFont:SetFont(fontStandard, 12) -- 声望面板描述

SpellFont_Small:SetFont(fontStandard, 12) -- 技能面板小字体
SpellFont_Small:SetShadowColor(0, 0, 0)
SpellFont_Small:SetShadowOffset(1, -1)

SystemFont_InverseShadow_Small:SetFont(fontStandard, 10)
SystemFont_Large:SetFont(fontStandard, 16)
SystemFont_Large:SetShadowColor(0, 0, 0)
SystemFont_Large:SetShadowOffset(1, -1)
SystemFont_Huge1:SetFont(fontStandard, 20)
SystemFont_Huge1:SetShadowColor(0, 0, 0)
SystemFont_Huge1:SetShadowOffset(1, -1)
SystemFont_Med1:SetFont(fontStandard, 12)
SystemFont_Med1:SetShadowColor(0, 0, 0)
SystemFont_Med1:SetShadowOffset(1, -1)
SystemFont_Med2:SetFont(fontStandard, 13)
SystemFont_Med2:SetShadowColor(0, 0, 0)
SystemFont_Med2:SetShadowOffset(1, -1)
SystemFont_Med3:SetFont(fontStandard, 14)
SystemFont_Med3:SetShadowColor(0, 0, 0)
SystemFont_Med3:SetShadowOffset(1, -1)
SystemFont_OutlineThick_WTF:SetFont(fontStandard, 32, "THICKOUTLINE")
SystemFont_OutlineThick_Huge2:SetFont(fontStandard, 22, "THICKOUTLINE")
SystemFont_OutlineThick_Huge4:SetFont(fontStandard, 26, "THICKOUTLINE")
SystemFont_Outline_Small:SetFont(fontStandard, 10, "OUTLINE")
SystemFont_Outline:SetFont(fontStandard, 13, "OUTLINE")
SystemFont_Shadow_Large:SetFont(fontStandard, 16)
SystemFont_Shadow_Large_Outline:SetFont(fontStandard, 16)
SystemFont_Shadow_Large2:SetFont(fontStandard, 18)
SystemFont_Shadow_Med1:SetFont(fontStandard, 12)
SystemFont_Shadow_Med1_Outline:SetFont(fontStandard, 12, "OUTLINE")
SystemFont_Shadow_Med2:SetFont(fontStandard, 13)
SystemFont_Shadow_Med3:SetFont(fontStandard, 14)
SystemFont_Shadow_Outline_Huge2:SetFont(fontStandard, 22, "OUTLINE")
SystemFont_Shadow_Huge1:SetFont(fontStandard, 20)
SystemFont_Shadow_Huge2:SetFont(fontStandard, 24)
SystemFont_Shadow_Huge3:SetFont(fontStandard, 25)
SystemFont_Shadow_Small:SetFont(fontStandard, 11) -- 主要小字体
SystemFont_Shadow_Small2:SetFont(fontStandard, 11)
SystemFont_Small:SetFont(fontStandard, 11) -- 成就面板成就描述，技能面板技能需求等级
SystemFont_Small:SetShadowColor(0, 0, 0)
SystemFont_Small:SetShadowOffset(1, -1)
SystemFont_Small2:SetFont(fontStandard, 12)
SystemFont_Small2:SetShadowColor(0, 0, 0)
SystemFont_Small2:SetShadowOffset(1, -1)
SystemFont_Tiny:SetFont(fontStandard, 12)
SystemFont_Tiny:SetShadowColor(0, 0, 0)
SystemFont_Tiny:SetShadowOffset(1, -1)

ZoneTextFont:SetFont(fontDiablo, 100)
ZoneTextFont:SetShadowColor(0, 0, 0)
ZoneTextFont:SetShadowOffset(1, -1)
SubZoneTextFont:SetFont(fontDiablo, 68)
SubZoneTextFont:SetShadowColor(0, 0, 0)
SubZoneTextFont:SetShadowOffset(1, -1)
PVPInfoTextFont:SetFont(fontDiablo, 48)
PVPInfoTextFont:SetShadowColor(0, 0, 0)
PVPInfoTextFont:SetShadowOffset(1, -1)

WorldMapTextFont:SetFont(fontDiablo, 100)
WorldMapTextFont:SetShadowColor(0, 0, 0)
WorldMapTextFont:SetShadowOffset(1, -1)

-- Why?
HelpFrameKnowledgebaseNavBarHomeButtonText:SetFont(fontStandard, 12)
WorldMapFrameNavBarHomeButtonText:SetFont(fontStandard, 12)
