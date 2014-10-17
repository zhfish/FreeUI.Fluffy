local _, sakaras = ...
local Misc = sakaras.FilgerSettings

Filger_Spells = {
	
	["WARLOCK"] = {			--[术士]
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 2,
			Alpha = 1,
			IconSize = Misc.IconSizePBuff,
			Position = {unpack(Filger_Settings.player_buff_icon)},

			-- Dark Bargain
			{spellID = 110913, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unending Resolve
			{spellID = 104773, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Knowledge
			{spellID = 113861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Misery
			{spellID = 113860, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Instability
			{spellID = 113858, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul burn
			{spellID = 74434, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Swap
			{spellID = 86211, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Rush
			{spellID = 111400, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fire and Brimstone 硫磺烈火
			{spellID = 108683, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "P_PROC_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 2,
			Alpha = 1,
			IconSize = Misc.IconSizePProc,
			Position = {unpack(Filger_Settings.player_proc_icon)},

			-- Buffs
			-- Molten Core
			{spellID = 122355, unitID = "player", caster = "player", filter = "BUFF"},
			-- Backdraft
			{spellID = 117828, unitID = "player", caster = "player", filter = "BUFF"},
			-- Backlash
			--WoD {spellID = 34936, unitID = "player", caster = "player", filter = "BUFF"},
			-- Demonic Rebirth
			--WoD {spellID = 108559, unitID = "player", caster = "player", filter = "BUFF"},

			-- Item sets
			-- Ember Master (T16)
			{spellID = 145164, unitID = "player", caster = "player", filter = "BUFF"},

			-- Trinkets
			-- General
			-- Darkmoon Cards (Proc)
			{spellID = 128985, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets (Health, Use)
			{spellID = 126697, unitID = "player", caster = "player", filter = "BUFF"},
			-- Caster General
			-- Shock-Charger Medallion Figurine (Intellect, Use)
			{spellID = 136082, unitID = "player", caster = "player", filter = "BUFF"},
			-- Jade Magistrate Figurine (Crit, Use)
			{spellID = 126605, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets (Spell Power, Use)
			{spellID = 126683, unitID = "player", caster = "player", filter = "BUFF"},
			-- PvP Trinkets (Spell Power, Proc)
			{spellID = 126705, unitID = "player", caster = "player", filter = "BUFF"},
			-- Caster DPS
			-- Purified Bindings of Immerseus (Intellect, Proc)
			{spellID = 146046, unitID = "player", caster = "player", filter = "BUFF"},
			-- Kardris' Toxic Totem (Intellect, Proc)
			{spellID = 148906, unitID = "player", caster = "player", filter = "BUFF"},
			-- Frenzied Crystal of Rage (Intellect, Proc)
			{spellID = 148897, unitID = "player", caster = "player", filter = "BUFF"},
			-- Black Blood of Y'Shaarj (Intellect, Proc)
			{spellID = 146184, unitID = "player", caster = "player", filter = "BUFF"},
			-- Yu'lon's Bite (Crit, Proc)
			{spellID = 146218, unitID = "player", caster = "player", filter = "BUFF"},
			-- 雷神的精准之视
			{spellID = 138963, unitID = "player", caster = "player", filter = "BUFF"},
			-- Volatile Talisman of the Shado-Pan Assault (Haste, Proc)
			{spellID = 138703, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cha-Ye's Essence of Brilliance (Intellect, Proc)
			{spellID = 139133, unitID = "player", caster = "player", filter = "BUFF"},
			-- Breath of the Hydra (Intellect, Proc)
			{spellID = 138898, unitID = "player", caster = "player", filter = "BUFF"},
			-- Wushoolay's Final Choice (Intellect, Proc)
			{spellID = 138786, unitID = "player", caster = "player", filter = "BUFF"},
			-- Essence of Terror (Haste, Proc)
			{spellID = 126659, unitID = "player", caster = "player", filter = "BUFF"},
			-- Light of the Cosmos (Intellect, Proc)
			{spellID = 126577, unitID = "player", caster = "player", filter = "BUFF"},

			-- Enchants
			-- General
			-- Caster General
			-- Jade Spirit (Intellect + Spirit)
			{spellID = 104993, unitID = "player", caster = "all", filter = "BUFF"},
			-- Lightweave (Intellect)
			{spellID = 125487, unitID = "player", caster = "player", filter = "BUFF"},

			-- 橙色多彩
			-- 阴险之源钻 (暴击, 急速)
			{spellID = 137590, unitID = "player", caster = "all", filter = "BUFF"},

			-- Rocket Fuel Leak 火箭鞋漏油
			{spellID = 94794, unitID = "player", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 2,
			Alpha = 1,
			IconSize = Misc.IconSizeTDebuff,
			Position = {unpack(Filger_Settings.target_debuff_icon)},

			-- Self
			-- Enslave Demon
			{spellID = 1098, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Doom
			{spellID = 603, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Agony
			{spellID = 980, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Corruption
			{spellID = 146739, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Seed of Corruption
			{spellID = 27243, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Immolate
			{spellID = 348, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 30108, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Haunt
			{spellID = 48181, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "T_DE/BUFF_BAR",
			enable = Misc.Tbar,
			Direction = "UP",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = Misc.barIconSize,
			BarWidth = Misc.barw,
			Position = {unpack(Filger_Settings.target_bar)},

			-- Doom
			{spellID = 603, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Agony
			{spellID = 980, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Corruption
			{spellID = 146739, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Seed of Corruption
			{spellID = 27243, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Immolate
			{spellID = 348, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 30108, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Haunt
			{spellID = 48181, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "PVE/PVP_CC",
			enable = Misc.Pbar,
			Direction = "DOWN",
			IconSide = "LEFT",
			Mode = "BAR",
			Interval = 3,
			Alpha = 1,
			IconSize = Misc.barIconSize,
			BarWidth = Misc.barw,
			Position = {unpack(Filger_Settings.pve_cc)},

			-- Fear
			{spellID = 118699, unitID = "focus", caster = "player", filter = "DEBUFF"},
			-- Banish
			{spellID = 710, unitID = "focus", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "COOLDOWN",
			enable = Misc.CD,
			Direction = "LEFT",
			Mode = "ICON",
			NumPerLine = Misc.CDnum,
			Interval = 2,
			Alpha = 1,
			IconSize = Misc.CDIconSize,
			Position = {unpack(Filger_Settings.cooldown)},

			-- Self
			-- Devour Magic (Felhunter)
			{spellID = 19505, filter = "CD"},
			-- Spell Lock (Felhunter)
			{spellID = 19647, filter = "CD"},
			-- Shadowfury
			{spellID = 30283, filter = "CD"},
			-- Howl of Terror
			{spellID = 5484, filter = "CD"},
			-- Mortal Coil
			{spellID = 6789, filter = "CD"},
			-- Sacrifice (Voidwalker)
			{spellID = 7812, filter = "CD"},
			-- Hand of Gul'dan
			{spellID = 105174, filter = "CD"},
			-- Demonic Circle: Teleport
			{spellID = 48020, filter = "CD"},
			-- Felstorm
			{spellID = 89751, filter = "CD"},
			-- Soulburn
			{spellID = 74434, filter = "CD"},
			-- Grimoire of Service
			{spellID = 108501, filter = "CD"},

			-- Racial
			-- Every Man for Himself (Human)
			{spellID = 59752, filter = "CD"},
			-- Stoneform (Dwarf)
			{spellID = 20594, filter = "CD"},
			-- Escape Artist (Gnome)
			{spellID = 20589, filter = "CD"},
			-- Darkflight (Worgen)
			{spellID = 68992, filter = "CD"},
			-- Blood Fury (Orc)
			{spellID = 20572, filter = "CD"},
			-- Will of the Forsaken (Forsaken)
			{spellID = 7744, filter = "CD"},
			-- Cannibalize (Forsaken)
			{spellID = 20577, filter = "CD"},
			-- Berserking (Troll)
			{spellID = 26297, filter = "CD"},
			-- Arcane Torrent (Blood Elf)
			{spellID = 69179, filter = "CD"},
			-- Rocket Jump (Goblin)
			{spellID = 69070, filter = "CD"},

			-- Items
			-- Gloves
			{slotID = 10, filter = "CD"},
			-- Belt
			{slotID = 6, filter = "CD"},
			-- Back
			{slotID = 15, filter = "CD"},
			-- Trinkets
			{slotID = 13, filter = "CD"},
			{slotID = 14, filter = "CD"},

			-- Internal
			-- Lightweave
			{spellID = 125487, filter = "ICD", trigger = "BUFF", duration = 60},
			-- Purified Bindings of Immerseus (Intellect, Proc)
			{spellID = 146046, filter = "ICD", trigger = "BUFF", duration = 115},
		},
	},

	["ALL"] = {			--[集体]
		{
			Name = "SPECIAL_P_BUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 2,
			Alpha = 1,
			IconSize = Misc.IconSizePSpec,
			Position = {unpack(Filger_Settings.special_proc_icon)},

			-- Potions
			-- Virmen's Bite
			{spellID = 105697, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potion of Mogu Power
			{spellID = 105706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potion of the Jade Serpent
			{spellID = 105702, unitID = "player", caster = "player", filter = "BUFF"},
			-- Kafa Press 咔啡提神(急速+4000，25秒)
			{spellID = 125282, unitID = "player", caster = "player", filter = "BUFF"},
			-- Speed (Potion)
			{spellID = 2379, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Speed (BG)
			{spellID = 23451, unitID = "player", caster = "all", filter = "BUFF", absID = true},

			-- Leeroy Jenkins
			-- Bloodlust
			{spellID = 2825, unitID = "player", caster = "all", filter = "BUFF"},
			-- Heroism
			{spellID = 32182, unitID = "player", caster = "all", filter = "BUFF"},
			-- Time Warp
			{spellID = 80353, unitID = "player", caster = "all", filter = "BUFF"},
			-- Ancient Hysteria
			{spellID = 90355, unitID = "player", caster = "all", filter = "BUFF"},
			-- Drums of Rage
			{spellID = 146555, unitID = "player", caster = "all", filter = "BUFF"},
			
			-- Professions
			-- Synapse Springs
			{spellID = 126734, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phase Fingers
			--WoD {spellID = 108788, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nitro Boosts
			{spellID = 54861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Parachute
			{spellID = 55001, unitID = "player", caster = "player", filter = "BUFF"},
			-- Lifeblood
			--WoD {spellID = 74497, unitID = "player", caster = "player", filter = "BUFF"},

			-- Racial
			-- Berserking (Troll)
			{spellID = 26297, unitID = "player", caster = "player", filter = "BUFF", absID = true},
			-- Stoneform (Dwarf)
			{spellID = 65116, unitID = "player", caster = "player", filter = "BUFF"},
			-- Blood Fury (Orc)
			{spellID = 20572, unitID = "player", caster = "player", filter = "BUFF"},
			-- Darkflight (Worgen)
			{spellID = 68992, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shadowmeld (Night Elf)
			{spellID = 58984, unitID = "player", caster = "player", filter = "BUFF"},
			-- Gift of the Naaru (Draenei)
			{spellID = 28880, unitID = "player", caster = "all", filter = "BUFF"},

			-- Other
			-- Hand of Protection
			{spellID = 1022, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Freedom
			{spellID = 1044, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Sacrifice
			{spellID = 6940, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Purity
			{spellID = 114039, unitID = "player", caster = "all", filter = "BUFF"},
			-- Life Cocoon
			{spellID = 116849, unitID = "player", caster = "all", filter = "BUFF"},
			-- Guardian Spirit
			{spellID = 47788, unitID = "player", caster = "all", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, unitID = "player", caster = "all", filter = "BUFF"},
			-- Vigilance
			{spellID = 114030, unitID = "player", caster = "all", filter = "BUFF"},
			-- Ironbark
			{spellID = 102342, unitID = "player", caster = "all", filter = "BUFF"},
			-- Devotion Aura
			{spellID = 31821, unitID = "player", caster = "all", filter = "BUFF"},
			-- Rallying Cry
			{spellID = 97463, unitID = "player", caster = "all", filter = "BUFF"},
			-- Tricks of the Trade
			{spellID = 57933, unitID = "player", caster = "all", filter = "BUFF"},
			-- Stampeding Roar
			{spellID = 77764, unitID = "player", caster = "all", filter = "BUFF"},
			-- Mass Spell Reflection
			{spellID = 114028, unitID = "player", caster = "all", filter = "BUFF"},
			-- Grounding Totem
			{spellID = 8178, unitID = "player", caster = "all", filter = "BUFF"},
			-- Lightwell Renew
			{spellID = 7001, unitID = "player", caster = "all", filter = "BUFF"},
			-- Slow Fall
			{spellID = 130, unitID = "player", caster = "all", filter = "BUFF"},
			-- Levitate
			{spellID = 1706, unitID = "player", caster = "all", filter = "BUFF"},
			-- Tiger's Lust
			{spellID = 116841, unitID = "player", caster = "all", filter = "BUFF"},
			-- Body and Soul
			{spellID = 65081, unitID = "player", caster = "all", filter = "BUFF"},
			-- Angelic Feather
			{spellID = 121557, unitID = "player", caster = "all", filter = "BUFF"},
			-- Fear Ward
			{spellID = 6346, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "RAID_AURA_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = Misc.IconSizeRaidAura,
			Position = {unpack(Filger_Settings.RAID_AURA_ICON)},
			
			--  -- <<  PVE  >> -- --
			-- Throne of Thunder	-- 雷电王座 930
			-- Jin'rokh the Breaker [击碎者金罗克] --
			-- Focused Lightning 专注闪电
			{spellID = 137422, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 电离反应
			{spellID = 138732, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 静电创伤
			{spellID = 138349, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 雷霆投掷
			{spellID = 137371, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 郝利东 --
			-- 三重穿刺
			{spellID = 136767, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 冲锋
			{spellID = 136769, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 流沙陷阱
			{spellID = 136723, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 活化毒素
			{spellID = 136646, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 寒冰宝珠
			{spellID = 136573, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 闪电新星
			{spellID = 136490, unitID = "player", caster = "all", filter = "DEBUFF"},
         
			-- Council of Elders [长者议会] --
			-- 灵魂残片
			{spellID = 137641, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Marked Soul 标记灵魂
			{spellID = 137359, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 扭曲命运
			{spellID = 137972, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 冰寒突击
			{spellID = 136903, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frostbite 霜寒刺骨
			{spellID = 136922, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Biting Cold 刺骨之寒
			{spellID = 136992, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 托多斯 --
			-- 百裂爪
			{spellID = 136753, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 晶化甲壳
			{spellID = 137633, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 晶化甲壳：临界值！
			{spellID = 140701, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Megaera [墨格瑞拉] --
			-- 燃烧血肉
			{spellID = 137731, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Torrent of Ice 寒冰洪流
			{spellID = 139857, unitID = "player", caster = "all", filter = "DEBUFF"},
			{spellID = 139889, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cinder 燃烬
			{spellID = 134391, unitID = "player", caster = "all", filter = "DEBUFF"},
			{spellID = 139822, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 季鹍 --
			-- 爪掠
			{spellID = 134366, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 灵巧之翼
			{spellID = 134339, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 遗忘者杜鲁姆 --
			-- 严重致伤
			{spellID = 133767, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 蓝光追踪
			{spellID = 139202, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 红光追踪
			{spellID = 139204, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 强光
			{spellID = 133738, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 纠缠凝视
			{spellID = 134044, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 吸血
			{spellID = 133795, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 普利莫修斯 --
			{spellID = 136050, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 黑暗意志 --
			-- 爆炸猛击
			{spellID = 138569, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 猩红追击
			{spellID = 138480, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 心能之环
			{spellID = 136954, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 物质交换
			{spellID = 138618, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 铁穹 --
			-- 穿刺
			{spellID = 134691, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烧灼
			{spellID = 134647, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 魔古双后 --
			-- 寒冷阴影
			{spellID = 137440, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烈焰刃舞
			{spellID = 137408, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 堕落治疗
			{spellID = 137360, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 梦魇兽
			{spellID = 137375, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Lei Shen [雷神] --
			-- 斩首
			{spellID = 135000, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Static Shock 静电冲击
			{spellID = 135695, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 超载
			{spellID = 136295, unitID = "player", caster = "all", filter = "DEBUFF"},
		 
			
			-- Mogu'shan Vaults -- 魔古山宝库 896
			-- The Stone Guard [石头守卫]
			-- Amethyst Pool 紫晶之池
			{spellID = 116235, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Jasper Chains 红玉锁链
			{spellID = 130395, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Feng the Accursed [受诅者魔封]
			-- Wildfire Spark 野性火花
			{spellID = 116784, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Arcane Resonance 奥术回响
			{spellID = 116417, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Nullification Barrier 废灵壁垒
			{spellID = 115856, unitID = "player", caster = "all", filter = "BUFF"},
			-- Shroud of Reversal 反射罩
			{spellID = 115911, unitID = "player", caster = "all", filter = "BUFF"},
			
			-- Gara'jal the Spiritbinder [缚灵者戈拉亚]
			-- Voodoo Doll 巫毒娃娃
			{spellID = 122151, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cross Over 灵魂越界
			{spellID = 116166, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Elegon [伊拉贡]
			-- Overcharged 能量超载
			{spellID = 117878, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Closed Circuit 封闭回路
			{spellID = 117949, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Will of the Emperor [皇帝的意志]
			-- Focused Assault 专注打击
			{spellID = 116525, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Focused Energy 专注能量
			{spellID = 116829, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			
			-- Heart of Fear -- 恐惧之心 897
			-- Imperial Vizier Zor'lok [皇家宰相佐尔洛克]
			-- Exhale 吐气
			{spellID = 122761, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Blade Lord Ta'yak [刀锋领主塔亚克]
			-- Overwhelming Assault 压制突袭
			{spellID = 123474, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Windstep 疾风步
			{spellID = 123175, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Unseen Strike 无影击
			{spellID = 123017, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Garalon [加拉隆]
			-- Pheromones 信息素
			{spellID = 123092, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Wind Lord Mel'Jarak [风领主梅尔加拉克]
			-- Wind Bomb 风爆弹
			{spellID = 131813, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Amber Prison 琥珀监牢
			{spellID = 121885, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Corrosive Resin 腐蚀树脂
			{spellID = 122064, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Amber-Shaper Un'sok [琥珀塑形者昂舒克]
			-- Burning Amber
			{spellID = 122504, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Parasitic Growth 寄生增长
			{spellID = 121949, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Grand Empress Shek'zeer [大女皇夏柯希尔]
			-- Eyes of the Empress 女皇邪眼
			{spellID = 123707, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fixate
			-- Sticky Resin 粘稠树脂
			{spellID = 124097, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Poison-Drenched Armor 浸毒护甲
			{spellID = 124821, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Consuming Terror 恐惧吞噬
			{spellID = 124849, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Visions of Demise 死亡幻像
			{spellID = 124862, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Heart of Fear 恐惧之心
			{spellID = 123845, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			
			-- terrace of endless spring -- 永春台 886
			-- Protector of the Endless [无尽守护者]
			-- Lightning Prison 闪电牢笼
			{spellID = 111850, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Defiled Ground 大地污染
			{spellID = 117986, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Corrupted Essence 大型堕落精华
			{spellID = 117905, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Tsulong [烛龙]
			-- Dread Shadows 恐惧之影
			{spellID = 122768, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadow Breath 暗影吐息
			{spellID = 122752, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Terrorize 暗影恐怖
			{spellID = 123011, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Lei Shi [雷施]
			-- Spray 喷射
			{spellID = 123121, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Scary Fog 恐怖迷雾
			{spellID = 123705, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Sha of Fear [惧之煞]
			-- Fearless 无畏
			{spellID = 118977, unitID = "player", caster = "all", filter = "BUFF"},
			
			
			-- 决战奥格瑞玛 Siege Of Orgrimmar 953
			-- 1	伊墨苏斯 [Immerseus]
			-- 邪煞池
			{spellID = 143297, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 腐蚀冲击
			{spellID = 143436, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 煞能腐蚀 H
			{spellID = 143579, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 2	堕落的守护者 [FallenProtectors]
			-- 锁喉
			{spellID = 143198, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 苦痛印记
			{spellID = 143840, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 暗影虚弱
			{spellID = 144176, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 煞能灼烧
			{spellID = 143423, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 3	诺鲁什 [Norushen]
			-- 净化
			{spellID = 144452, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 自惑
			{spellID = 146124, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 纠缠腐蚀
			{spellID = 144514, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 4	傲之煞 [ShaofPride]
			-- 受损自尊
			{spellID = 144358, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 傲气光环
			{spellID = 146817, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 投影
			{spellID = 146822, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 泰坦之赐
			{spellID = 146594, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 泰坦之力
			{spellID = 144364, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 动摇的决心 H
			{spellID = 147207, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 5	迦拉卡斯 [Galakras]
			-- 毒性云雾
			{spellID = 147705, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烈焰箭
			{spellID = 146765, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 迦拉克隆之焰 (点名)
			--{spellID = 147068, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 迦拉克隆之焰 (debuff)
			{spellID = 147029, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 6	钢铁战蝎 [IronJuggernaut]
			-- 燃烧护甲
			{spellID = 144467, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 爆裂焦油
			{spellID = 144498, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 切割激光
			{spellID = 146325, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 7	库卡隆黑暗萨满 [KorkronDarkShaman]
			-- 冰霜风暴打击
			{spellID = 144215, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 撕裂
			{spellID = 144304, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 剧毒之雾
			{spellID = 144089, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 钢铁囚笼 H
			{spellID = 144330, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 8	纳兹戈林将军 [GeneralNazgrim]
			-- 碎甲重击
			{spellID = 143494, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 碎骨重锤
			{spellID = 143638, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 刺客印记
			{spellID = 143480, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 猎人印记
			{spellID = 143882, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 9	马尔考罗克 [Malkorok]
			-- 致命打击
			{spellID = 142990, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 散逸能量
			{spellID = 142913, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 受难 H
			{spellID = 143919, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 10	潘达利亚战利品 [SpoilsOfPandria]
			-- 设置炸药
			{spellID = 145987, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 浓缩信息素
			{spellID = 145747, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 11	嗜血的索克 [ThokTheBloodthirsty]
			-- 恐慌
			{spellID = 143766, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 灼热吐息
			{spellID = 143767, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 酸性吐息
			{spellID = 143780, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 冰冻吐息
			{spellID = 143773, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 锁定
			{spellID = 143445, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 冰冻之血
			{spellID = 143800, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 12	攻城匠师黑索 [SiegecrafterBlackfuse]
			-- 电荷冲击
			{spellID = 143385, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 过热
			{spellID = 143856, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 图像识别
			{spellID = 144236, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 13	卡拉克西英杰 [ParagonsOfTheKlaxxi]
			-- 注射
			{spellID = 143339, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 红色毒素
			{spellID = 142533, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 蓝色毒素
			{spellID = 142532, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 黄色毒素
			{spellID = 142534, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 橙色毒素
			{spellID = 142547, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 橙色催化爆炸之环
			{spellID = 142803, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 绿色毒素
			{spellID = 142549, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 绿色催化诡异之雾
			{spellID = 142945, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 紫色催化热罐燃料
			{spellID = 143572, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 白色毒素
			{spellID = 142550, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 血脉暴露
			{spellID = 142931, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 挥砍
			{spellID = 143275, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 基因变异
			{spellID = 143279, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 凿击
			{spellID = 143939, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 盾击
			{spellID = 143974, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 酸性血液
			{spellID = 142315, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 催眠术
			{spellID = 142671, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 瞄准
			{spellID = 142948, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 炎界的火线
			{spellID = 142808, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 变异缺陷
			{spellID = 148589, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 14	加尔鲁什·地狱咆哮 [GarroshHellscream]
			-- 绝望之握
			{spellID = 145183, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 强化绝望之握
			{spellID = 145195, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 绝望之破
			{spellID = 145213, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 信念
			{spellID = 148994, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 勇气
			{spellID = 148983, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 希望
			{spellID = 149004, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 亵渎(P2)
			--{spellID = 144762, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 亵渎(P3)
			{spellID = 144817, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 亚煞极之触
			{spellID = 145065, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 強化亚煞极之触
			{spellID = 145171, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 凝视 H
			{spellID = 147665, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 液态火焰 H
			{spellID = 147136, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 恶意 H
			{spellID = 147209, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 恶意冲击 H
			{spellID = 147235, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 15	其它 [SooTrash]
			-- 断骨
			{spellID = 147200, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 决战奥格瑞玛 [结束]
			
			
			
			-- outdoor bosses -- 户外首领
			-- Sha of Anger [怒之煞]
			--Seethe
			{spellID = 119487, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Aggressive Behavior
			{spellID = 119626, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Unleashed Wrath
			{spellID = 119488, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			--Salys's Warband [萨莱斯兵团]
			-- Stomp
			{spellID = 121787, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			--Yu'lon	玉珑(青龙)
			--Xuen		雪怒(白虎)
			--Chi-ji	赤精(朱鹤)
			--Niuzao	砮皂(玄牛)
			--Ordos		斡耳朵斯(野牛人火神)
			
			-- 心智 [尤格萨隆]
			{spellID = 63050, unitID = "player", caster = "all", filter = "DEBUFF"},
		},
		{
			Name = "T_BUFF",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 3,
			Alpha = 1,
			IconSize = Misc.IconSizeTBuff,
			Position = {unpack(Filger_Settings.target_buff_icon)},

			-- Death knight
			-- Anti-Magic Shell
			{spellID = 48707, unitID = "target", caster = "all", filter = "BUFF"},
			-- Desecrated Ground
			{spellID = 115018, unitID = "target", caster = "all", filter = "BUFF"},
			-- Lichborne
			{spellID = 49039, unitID = "target", caster = "all", filter = "BUFF"},
			-- Icebound Fortitude
			{spellID = 48792, unitID = "target", caster = "all", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, unitID = "target", caster = "all", filter = "BUFF"},
			-- Death's Advance
			{spellID = 96268, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Remorseless Winter
			{spellID = 115001, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Asphyxiate
			{spellID = 108194, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Gnaw (Ghoul)
			{spellID = 91800, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Monstrous Blow (Mutated Ghoul)
			{spellID = 91797, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Strangulate
			{spellID = 47476, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Druid
			-- Survival Instincts
			{spellID = 61336, unitID = "target", caster = "all", filter = "BUFF"},
			-- Barkskin
			{spellID = 22812, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ironbark
			{spellID = 102342, unitID = "target", caster = "all", filter = "BUFF"},
			-- Nature's Grasp
			{spellID = 170856, unitID = "target", caster = "all", filter = "BUFF"},
			-- Stampeding Roar
			{spellID = 77764, unitID = "target", caster = "all", filter = "BUFF"},
			-- Incarnation: Tree of Life
			{spellID = 117679, unitID = "target", caster = "all", filter = "BUFF"},
			-- Berserk
			{spellID = 50334, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Cyclone
			{spellID = 33786, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mighty Bash
			{spellID = 5211, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Maim
			{spellID = 22570, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Rake
			{spellID = 163505, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Disorienting Roar
			{spellID = 99, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Solar Beam
			{spellID = 78675, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fae Silence
			{spellID = 114238, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Hunter
			-- Aspect of the Pack
			{spellID = 13159, unitID = "target", caster = "all", filter = "BUFF"},
			-- Aspect of the Cheetah
			{spellID = 5118, unitID = "target", caster = "all", filter = "BUFF"},
			-- Deterrence
			{spellID = 19263, unitID = "target", caster = "all", filter = "BUFF"},
			-- Posthaste
			{spellID = 118922, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Freezing Trap
			{spellID = 3355, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Wyvern Sting
			{spellID = 19386, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Binding Shot
			{spellID = 117526, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Intimidation
			{spellID = 24394, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Mage
			-- Ice Block
			{spellID = 45438, unitID = "target", caster = "all", filter = "BUFF"},
			-- Invisibility
			{spellID = 66, unitID = "target", caster = "all", filter = "BUFF"},
			-- Evocation
			{spellID = 12051, unitID = "target", caster = "all", filter = "BUFF"},
			-- Temporal Shield
			{spellID = 115610, unitID = "target", caster = "all", filter = "BUFF"},
			-- Alter Time
			{spellID = 110909, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Cauterize
			{spellID = 87023, unitID = "target", caster = "target", filter = "DEBUFF"},
			-- Polymorph
			{spellID = 118, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Deep Freeze
			{spellID = 44572, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Ring of Frost
			{spellID = 82691, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Dragon's Breath
			{spellID = 31661, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Frostjaw
			{spellID = 102051, unitID = "target", caster = "all", filter = "DEBUFF"},
			
			-- Monk
			-- Touch of Karma
			{spellID = 125174, unitID = "target", caster = "target", filter = "BUFF"},
			-- Ring of Peace
			{spellID = 116844, unitID = "target", caster = "target", filter = "BUFF"},
			-- Diffuse Magic
			{spellID = 122783, unitID = "target", caster = "target", filter = "BUFF"},
			-- Debuffs
			-- Paralysis
			{spellID = 115078, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Leg Sweep
			{spellID = 119381, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fists of Fury
			{spellID = 120086, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Charging Ox Wave
			{spellID = 119392, unitID = "target", caster = "all", filter = "DEBUFF"},
			
			-- Paladin
			-- Divine Shield
			{spellID = 642, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Protection
			{spellID = 1022, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Sacrifice
			{spellID = 6940, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Freedom
			{spellID = 1044, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Purity
			{spellID = 114039, unitID = "target", caster = "all", filter = "BUFF"},
			-- Devotion Aura
			{spellID = 31821, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ardent Defender
			{spellID = 31850, unitID = "target", caster = "all", filter = "BUFF"},
			-- Divine Protection
			{spellID = 498, unitID = "target", caster = "all", filter = "BUFF"},
			-- Guardian of Ancient Kings
			{spellID = 86659, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Hammer of Justice
			{spellID = 853, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fist of Justice
			{spellID = 105593, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Repentance
			{spellID = 20066, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Turn Evil
			{spellID = 10326, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Blinding Light
			{spellID = 105421, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Avenger's Shield
			{spellID = 31935, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Priest
			-- Dispersion
			{spellID = 47585, unitID = "target", caster = "all", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, unitID = "target", caster = "all", filter = "BUFF"},
			-- Guardian Spirit
			{spellID = 47788, unitID = "target", caster = "all", filter = "BUFF"},
			-- Phantasm
			{spellID = 114239, unitID = "target", caster = "all", filter = "BUFF"},
			-- Fear Ward
			{spellID = 6346, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Dominate Mind
			{spellID = 605, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Psychic Horror
			{spellID = 64044, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Silence
			{spellID = 15487, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Rogue
			-- Cloak of Shadows
			{spellID = 31224, unitID = "target", caster = "all", filter = "BUFF"},
			-- Evasion
			{spellID = 5277, unitID = "target", caster = "all", filter = "BUFF"},
			-- Cheating Death
			{spellID = 45182, unitID = "target", caster = "all", filter = "BUFF"},
			-- Combat Insight
			{spellID = 74002, unitID = "target", caster = "all", filter = "BUFF"},
			-- Shadow Dance
			{spellID = 51713, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Kidney Shot
			{spellID = 408, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Cheap Shot
			{spellID = 1833, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Sap
			{spellID = 6770, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Blind
			{spellID = 2094, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Garrote - Silence
			{spellID = 1330, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Smoke Bomb
			{spellID = 76577, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Shaman
			-- Grounding Totem Effect
			{spellID = 8178, unitID = "target", caster = "all", filter = "BUFF"},
			-- Shamanistic Rage
			{spellID = 30823, unitID = "target", caster = "all", filter = "BUFF"},
			-- Spiritwalker's Grace
			{spellID = 79206, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Hex
			{spellID = 51514, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Static Charge
			{spellID = 118905, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Pulverize (Earth Elemental)
			{spellID = 118345, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Warlock
			-- Dark Bargain
			{spellID = 110913, unitID = "target", caster = "all", filter = "BUFF"},
			-- Unending Resolve
			{spellID = 104773, unitID = "target", caster = "all", filter = "BUFF"},
			-- Soulstone
			{spellID = 20707, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Banish
			{spellID = 710, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Shadowfury
			{spellID = 30283, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Axe Toss (Felguard)
			{spellID = 89766, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fear
			{spellID = 118699, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Blood Horror
			{spellID = 137143, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mortal Coil
			{spellID = 6789, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Seduction (Succubus)
			{spellID = 6358, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mesmerize (Shivarra)
			{spellID = 115268, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 31117, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			
			-- Warrior
			-- Spell Reflection
			{spellID = 23920, unitID = "target", caster = "all", filter = "BUFF"},
			-- Mass Spell Reflection
			{spellID = 114028, unitID = "target", caster = "all", filter = "BUFF"},
			-- Die by the Sword
			{spellID = 118038, unitID = "target", caster = "all", filter = "BUFF"},
			-- Shield Wall
			{spellID = 871, unitID = "target", caster = "all", filter = "BUFF"},
			-- Berserker Rage
			{spellID = 18499, unitID = "target", caster = "all", filter = "BUFF"},
			-- Last Stand
			{spellID = 12975, unitID = "target", caster = "all", filter = "BUFF"},
			-- Bladestorm
			{spellID = 46924, unitID = "target", caster = "all", filter = "BUFF"},
			-- Debuffs
			-- Storm Bolt
			{spellID = 132169, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Shockwave
			{spellID = 132168, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Intimidating Shout
			{spellID = 5246, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Silenced (Gag Order)
			{spellID = 18498, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- 刺耳怒吼
			{spellID = 12323, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Racial
			-- War Stomp
			{spellID = 20549, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Quaking Palm
			{spellID = 107079, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Arcane Torrent
			{spellID = 28730, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Heart of Fear
			-- Impaling Spear (Wind Lord Mel'jarak)
			{spellID = 122224, unitID = "target", caster = "all", filter = "DEBUFF"},
		
			-- All
			-- Warsong Flag
			{spellID = 23333, unitID = "target", caster = "all", filter = "BUFF"},
			{spellID = 23335, unitID = "target", caster = "all", filter = "BUFF"},
			-- Netherstorm Flag
			{spellID = 34976, unitID = "target", caster = "all", filter = "BUFF"},
			-- Orb of Power
			{spellID = 121175, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Seaforium
			{spellID = 66271, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Drink
			{spellID = 80167, unitID = "target", caster = "all", filter = "BUFF"},
		},
	},
}