local F, C, L = unpack(select(2, ...))

local font = 'Fonts\\cy_emblem.ttf'
local Zpix = 'Fonts\\Zpix.ttf'
local DamageFont = 'Fonts\\FruityMicrofont.ttf'
local Lihei = 'Fonts\\lihei.ttf'
local CuYuan = 'Fonts\\cuyuan.ttf'
local ZhunYuan = 'Fonts\\zhunyuan.ttf'
local Emblem = 'Fonts\\cy_emblem.ttf'
local Expressway = 'Fonts\\cy_expressway.ttf'
local NORDB = 'Fonts\\NORDB___.ttf'
local Din = 'Fonts\\din.ttf'
local Diablo = 'Fonts\\diablo.ttf'
local Pepsi = 'Fonts\\cy_pepsi.ttf'
local Hooge0655 = 'Fonts\\Hooge0655.ttf'
local yahei__ = 'Fonts\\yahei__.ttf'
local broadband = 'Fonts\\broadband.ttf'

RaidWarningFrame.slot1:SetFont(Emblem, 20, "OUTLINE")
RaidWarningFrame.slot2:SetFont(Emblem, 20, "OUTLINE")
RaidBossEmoteFrame.slot1:SetFont(Emblem, 20, "OUTLINE")
RaidBossEmoteFrame.slot2:SetFont(Emblem, 20, "OUTLINE")

UIErrorsFrame:SetFont(C.media.font, 8, "OUTLINEMONOCHROME")
UIErrorsFrame:SetShadowOffset(0, 0)

STANDARD_TEXT_FONT = CuYuan
UNIT_NAME_FONT     = yahei__
DAMAGE_TEXT_FONT   = DamageFont
NAMEPLATE_FONT     = CuYuan

AchievementFont_Small:SetFont(NORDB, 11)
AchievementFont_Small:SetShadowColor(0, 0, 0)
AchievementFont_Small:SetShadowOffset(1, -1)

CoreAbilityFont:SetFont(NORDB, 32)
CoreAbilityFont:SetShadowColor(0, 0, 0)
CoreAbilityFont:SetShadowOffset(1, -1)

DestinyFontHuge:SetFont(font, 32)
DestinyFontHuge:SetShadowColor(0, 0, 0)
DestinyFontHuge:SetShadowOffset(1, -1)
DestinyFontLarge:SetFont(font, 18)
DestinyFontLarge:SetShadowColor(0, 0, 0)
DestinyFontLarge:SetShadowOffset(1, -1)

FriendsFont_Normal:SetFont(font, 12)
FriendsFont_Small:SetFont(font, 10)
FriendsFont_Large:SetFont(font, 14)
FriendsFont_UserText:SetFont(font, 11)

GameFont_Gigantic:SetFont(font, 32)

GameTooltipHeader:SetFont(font, 14)
GameTooltipHeader:SetShadowColor(0, 0, 0)
GameTooltipHeader:SetShadowOffset(1, -1)

InvoiceFont_Small:SetFont(font, 10)
InvoiceFont_Small:SetShadowColor(0, 0, 0)
InvoiceFont_Small:SetShadowOffset(1, -1)
InvoiceFont_Med:SetFont(font, 12)
InvoiceFont_Med:SetShadowColor(0, 0, 0)
InvoiceFont_Med:SetShadowOffset(1, -1)

MailFont_Large:SetFont(font, 15)

NumberFont_OutlineThick_Mono_Small:SetFont(Din, 12, "OUTLINE")
NumberFont_Outline_Huge:SetFont(Din, 30, "OUTLINE")
NumberFont_Outline_Large:SetFont(Din, 16, "OUTLINE")
NumberFont_Outline_Med:SetFont(Din, 14, "OUTLINE")
NumberFont_Shadow_Med:SetFont(Din, 14)
NumberFont_Shadow_Small:SetFont(Din, 12)

QuestFont_Shadow_Small:SetFont(NORDB, 14)
QuestFont_Large:SetFont(Pepsi, 15)
QuestFont_Large:SetShadowColor(0, 0, 0)
QuestFont_Large:SetShadowOffset(1, -1)
QuestFont_Shadow_Huge:SetFont(broadband, 20) -- 任务面板右侧描述里的标题
QuestFont_Super_Huge:SetFont(font, 24)
QuestFont_Super_Huge:SetShadowColor(0, 0, 0)
QuestFont_Super_Huge:SetShadowOffset(1, -1)

ReputationDetailFont:SetFont(font, 10)

SpellFont_Small:SetFont(Emblem, 10)
SpellFont_Small:SetShadowColor(0, 0, 0)
SpellFont_Small:SetShadowOffset(1, -1)

SystemFont_InverseShadow_Small:SetFont(font, 10)
SystemFont_Large:SetFont(font, 16)
SystemFont_Large:SetShadowColor(0, 0, 0)
SystemFont_Large:SetShadowOffset(1, -1)
SystemFont_Huge1:SetFont(font, 20)
SystemFont_Huge1:SetShadowColor(0, 0, 0)
SystemFont_Huge1:SetShadowOffset(1, -1)
SystemFont_Med1:SetFont(font, 12)
SystemFont_Med1:SetShadowColor(0, 0, 0)
SystemFont_Med1:SetShadowOffset(1, -1)
SystemFont_Med2:SetFont(font, 13)
SystemFont_Med2:SetShadowColor(0, 0, 0)
SystemFont_Med2:SetShadowOffset(1, -1)
SystemFont_Med3:SetFont(font, 14)
SystemFont_Med3:SetShadowColor(0, 0, 0)
SystemFont_Med3:SetShadowOffset(1, -1)
SystemFont_OutlineThick_WTF:SetFont(font, 32, "THICKOUTLINE")
SystemFont_OutlineThick_WTF2:SetFont(font, 36)
SystemFont_OutlineThick_Huge2:SetFont(font, 22, "THICKOUTLINE")
SystemFont_OutlineThick_Huge4:SetFont(font, 26, "THICKOUTLINE")
SystemFont_Outline_Small:SetFont(font, 10, "OUTLINE")
SystemFont_Outline:SetFont(font, 13, "OUTLINE")
SystemFont_Shadow_Large:SetFont(font, 16)
SystemFont_Shadow_Large_Outline:SetFont(font, 16)
SystemFont_Shadow_Large2:SetFont(font, 18)
SystemFont_Shadow_Med1:SetFont(Emblem, 12)
SystemFont_Shadow_Med1_Outline:SetFont(font, 12, "OUTLINE")
SystemFont_Shadow_Med2:SetFont(font, 13)
SystemFont_Shadow_Med3:SetFont(font, 14)
SystemFont_Shadow_Outline_Huge2:SetFont(font, 22, "OUTLINE")
SystemFont_Shadow_Huge1:SetFont(font, 20)
SystemFont_Shadow_Huge2:SetFont(font, 24)
SystemFont_Shadow_Huge3:SetFont(font, 25)
SystemFont_Shadow_Small:SetFont(Emblem, 10)
SystemFont_Shadow_Small2:SetFont(font, 11)
SystemFont_Small:SetFont(font, 10)
SystemFont_Small:SetShadowColor(0, 0, 0)
SystemFont_Small:SetShadowOffset(1, -1)
SystemFont_Small2:SetFont(font, 11)
SystemFont_Small2:SetShadowColor(0, 0, 0)
SystemFont_Small2:SetShadowOffset(1, -1)
SystemFont_Tiny:SetFont(font, 9)
SystemFont_Tiny:SetShadowColor(0, 0, 0)
SystemFont_Tiny:SetShadowOffset(1, -1)

Tooltip_Med:SetFont(font, 12)
Tooltip_Med:SetShadowColor(0, 0, 0)
Tooltip_Med:SetShadowOffset(1, -1)
Tooltip_Small:SetFont(font, 10)
Tooltip_Small:SetShadowColor(0, 0, 0)
Tooltip_Small:SetShadowOffset(1, -1)

ZoneTextFont:SetFont(Diablo, 100)
ZoneTextFont:SetShadowColor(0, 0, 0)
ZoneTextFont:SetShadowOffset(1, -1)
SubZoneTextFont:SetFont(Diablo, 68)
SubZoneTextFont:SetShadowColor(0, 0, 0)
SubZoneTextFont:SetShadowOffset(1, -1)
PVPInfoTextFont:SetFont(Diablo, 48)
PVPInfoTextFont:SetShadowColor(0, 0, 0)
PVPInfoTextFont:SetShadowOffset(1, -1)

WorldMapTextFont:SetFont(Diablo, 100)
WorldMapTextFont:SetShadowColor(0, 0, 0)
WorldMapTextFont:SetShadowOffset(1, -1)



-- Why?
HelpFrameKnowledgebaseNavBarHomeButtonText:SetFont(font, 12)