local _, sakaras = ...
local Misc = sakaras.FilgerSettings

Filger_Spells = {
	
	["WARLOCK"] = {			
		{
			Name = "P_AURA",
			Direction = Misc.Dright,
			Mode = "ICON",
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.P_AURA)},

			-- talent
			-- Dark Rdgeneration
			{spellID = 108359, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sacirifical Pact
			{spellID = 108416, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Bargain
			{spellID = 110913, unitID = "player", caster = "player", filter = "BUFF"},
			-- Blood Horror
			{spellID = 111397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Rush
			{spellID = 111400, unitID = "player", caster = "player", filter = "BUFF"},
			-- Cunning
			{spellID = 137587, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fury
			{spellID = 108508, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soulburn: Haunt
			{spellID = 157698, unitID = "player", caster = "player", filter = "BUFF"},
			-- warlock self
			-- Soulstone
			{spellID = 20707, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soulburn: Demonic Circle
			{spellID = 79438, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Knowledge
			{spellID = 113861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Misery
			{spellID = 113860, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Instability
			{spellID = 113858, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unending Resolve
			{spellID = 104773, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soulburn
			{spellID = 74434, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Swap
			{spellID = 86211, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fire and Brimstone
			{spellID = 108683, unitID = "player", caster = "player", filter = "BUFF"},
			-- Backdraft
			{spellID = 117828, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "T_AURA_P",
			Direction = Misc.Dright,
			Mode = "ICON",
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.T_AURA_P)},

			-- Agony
			{spellID = 980, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Corruption
			{spellID = 146739, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Seed of Corruption
			{spellID = 27243, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Immolate
			{spellID = 348, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 30108, unitID = "target", caster = "player", filter = "DEBUFF", absID = true},
			-- Haunt
			{spellID = 48181, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "P_CD",
			Direction = Misc.Dright,
			Mode = "ICON",
			NumPerLine = Misc.CDnum,
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.P_CD)},

			-- Pet
			-- Devour Magic (Felhunter)
			{spellID = 19505, filter = "CD"},
			-- Spell Lock (Felhunter)
			{spellID = 19647, filter = "CD"},
			-- Optical Blast 
			{spellID = 115781, filter = "CD"},
			-- Clone Magic 
			{spellID = 115284, filter = "CD"},
			-- Self
			-- Talent
			-- Dark Rdgeneration
			{spellID = 108359, filter = "CD"},
			-- Shadowfury
			{spellID = 30283, filter = "CD"},
			-- Howl of Terror
			{spellID = 5484, filter = "CD"},
			-- Mortal Coil
			{spellID = 6789, filter = "CD"},
			-- Dark Bargain
			{spellID = 110913, filter = "CD"},
			-- Sacirifical Pact
			{spellID = 108416, filter = "CD"},
			-- unbound Will
			{spellID = 108482, filter = "CD"},
			-- Blood Horror
			{spellID = 111397, filter = "CD"},
			-- Cunning
			{spellID = 137587, filter = "CD"},
			-- Fury
			{spellID = 108508, filter = "CD"},
			-- Cataclysm
			{spellID = 152108, filter = "CD"},

			-- Dark Soul: Knowledge
			{spellID = 113861, filter = "CD"},
			-- Dark Soul: Misery
			{spellID = 113860, filter = "CD"},
			-- Dark Soul: Instability
			{spellID = 113858, filter = "CD"},
			-- Demonic Circle: Teleport
			{spellID = 48020, filter = "CD"},
			-- Grimoire of Service
			{spellID = 108501, filter = "CD"},
			-- unending resolve
			{spellID = 104773, filter = "CD"},
			-- havoc
			{spellID = 80240, filter = "CD"},
			-- conflagrate
			{spellID = 17962, filter = "CD"},

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
			-- Belt
			{slotID = 6, filter = "CD"},
			-- Back
			{slotID = 15, filter = "CD"},
			-- Trinkets
			{slotID = 13, filter = "CD"},
			{slotID = 14, filter = "CD"},
		},
	},
	["DEATHKNIGHT"] = {
		{
			Name = "P_AURA",
			Direction = Misc.Dright,
			Mode = "ICON",
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.P_AURA)},

			-- talent

			-- Bone Shield
			{spellID = 49222, unitID = "player", caster = "player", filter = "BUFF"},
			-- Vampiric Blood
			{spellID = 55233, unitID = "player", caster = "player", filter = "BUFF"},
			-- Icebound Fortitude
			{spellID = 48792, unitID = "player", caster = "player", filter = "BUFF"},
			-- Anti-Magic Shell
			{spellID = 48707, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dancing Rune Weapon
			{spellID = 81256, unitID = "player", caster = "player", filter = "BUFF"},
			-- Lichborne
			{spellID = 49039, unitID = "player", caster = "player", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, unitID = "player", caster = "player", filter = "BUFF"},
			-- Death's Advance
			{spellID = 96268, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unholy Blight
			{spellID = 115989, unitID = "player", caster = "player", filter = "BUFF"},

			-- Dark Succor
			{spellID = 101568, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Reaper
			{spellID = 114868, unitID = "player", caster = "player", filter = "BUFF"},

			-- Scent of Blood
			{spellID = 50421, unitID = "player", caster = "player", filter = "BUFF"},
			-- Crimson Scourge
			{spellID = 81141, unitID = "player", caster = "player", filter = "BUFF"},
			-- Freezing Fog
			{spellID = 59052, unitID = "player", caster = "player", filter = "BUFF"},
			-- Killing Machine
			{spellID = 51124, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sudden Doom
			{spellID = 81340, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unholy Strength
			{spellID = 53365, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Transformation
			{spellID = 63560, unitID = "pet", caster = "player", filter = "BUFF"},
			-- Shadow Infusion
			{spellID = 91342, unitID = "pet", caster = "player", filter = "BUFF", count = 5},
			-- Blood Charge
			{spellID = 114851, unitID = "player", caster = "player", filter = "BUFF"},
		},
		{
			Name = "T_AURA_P",
			Direction = Misc.Dright,
			Mode = "ICON",
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.T_AURA_P)},

			-- Blood Plague
			{spellID = 55078, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Frost Fever
			{spellID = 55095, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Soul Reaper
			{spellID = 130735, unitID = "target", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "P_CD",
			Direction = Misc.Dright,
			Mode = "ICON",
			NumPerLine = Misc.CDnum,
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.P_CD)},

			-- Self
			-- Mind Freeze
			{spellID = 47528, filter = "CD"},
			-- Strangulate
			{spellID = 47476, filter = "CD"},
			-- Gnaw (Ghoul)
			{spellID = 47481, filter = "CD"},
			-- Remorseless Winter
			{spellID = 108200, filter = "CD"},
			-- Dark Simulacrum
			{spellID = 77606, filter = "CD"},
			-- Soul Reaper
			{spellID = 130736, filter = "CD"},
			-- Death Grip
			{spellID = 49576, filter = "CD"},
			-- Plague Leech
			{spellID = 123693, filter = "CD"},
			-- Death and Decay
			{spellID = 43265, filter = "CD"},
			-- Death's Advance
			{spellID = 96268, filter = "CD"},
			-- Rune Tap
			{spellID = 48982, filter = "CD"},
			-- Anti-Magic Shell
			{spellID = 48707, filter = "CD"},
			-- Vampiric Blood
			{spellID = 55233, filter = "CD"},
			-- Pillar of Frost
			{spellID = 51271, filter = "CD"},
			-- Outbreak
			{spellID = 77575, filter = "CD"},
			-- Gorefiend's Grasp
			{spellID = 108199, filter = "CD"},
			-- Raise Dead
			{spellID = 46584, filter = "CD"},
			-- Dancing Rune Weapon
			{spellID = 49028, filter = "CD"},
			-- Unholy Blight
			{spellID = 115989, filter = "CD"},
			-- Lichborne
			{spellID = 49039, filter = "CD"},
			-- Desecrated Ground
			{spellID = 108201, filter = "CD"},
			-- Death Pact
			{spellID = 48743, filter = "CD"},
			-- Anti-Magic Zone
			{spellID = 51052, filter = "CD"},
			-- Icebound Fortitude
			{spellID = 48792, filter = "CD"},
			-- Summon Gargoyle
			{spellID = 49206, filter = "CD"},

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
			-- Belt
			{slotID = 6, filter = "CD"},
			-- Back
			{slotID = 15, filter = "CD"},
			-- Trinkets
			{slotID = 13, filter = "CD"},
			{slotID = 14, filter = "CD"},
		},
	},

	["ALL"] = {			
		{
			Name = "C_AURA",
			Direction = Misc.Dright,
			Mode = "ICON",
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeNormal,
			Position = {unpack(Filger_Settings.C_AURA)},

			-- WOD Potions
			-- 德拉诺力量药水		
			{spellID = 156428, unitID = "player", caster = "player", filter = "BUFF"},
			-- 德拉诺敏捷药水
			{spellID = 156423, unitID = "player", caster = "player", filter = "BUFF"},
			-- 德拉诺智力药水
			{spellID = 105706, unitID = "player", caster = "player", filter = "BUFF"},
			-- 德拉诺护甲药水
			{spellID = 156430, unitID = "player", caster = "player", filter = "BUFF"},
			
			-- WOD Enchants
			-- 雷神之印
			{spellID = 159234, unitID = "player", caster = "all", filter = "BUFF"},
			-- 战歌之印
			{spellID = 159675, unitID = "player", caster = "all", filter = "BUFF"},
			-- 血环之印
			{spellID = 173322, unitID = "player", caster = "all", filter = "BUFF"},
			-- 霜狼之印
			{spellID = 159676, unitID = "player", caster = "all", filter = "BUFF"},
			-- 影月之印
			{spellID = 159678, unitID = "player", caster = "all", filter = "BUFF"},
			-- 黑石之印
			{spellID = 159679, unitID = "player", caster = "all", filter = "BUFF"},
			
			-- WOD Trinkets
			-- Tank
			-- 骑士徽章
			{spellID = 162917, unitID = "player", caster = "all", filter = "BUFF"},
			-- 岩心雕像
			{spellID = 176982, unitID = "player", caster = "all", filter = "BUFF"},
			-- 起步的愚忠
			{spellID = 176460, unitID = "player", caster = "all", filter = "BUFF"},
			-- 普尔的盲目之眼
			{spellID = 176876, unitID = "player", caster = "all", filter = "BUFF"},
			-- 石化食肉孢子
			{spellID = 165824, unitID = "player", caster = "all", filter = "BUFF"},
			-- 不眠奥术精魂
			{spellID = 177053, unitID = "player", caster = "all", filter = "BUFF"},
			-- 不屑合击石板
			{spellID = 176873, unitID = "player", caster = "all", filter = "BUFF"},
			-- 爆裂熔炉之门
			{spellID = 177056, unitID = "player", caster = "all", filter = "BUFF"},
			-- 重击护符
			{spellID = 177102, unitID = "player", caster = "all", filter = "BUFF"},
			-- Melee DPS General
			-- 战争之颅
			{spellID = 162915, unitID = "player", caster = "all", filter = "BUFF"},
			-- Strength Melee DPS
			-- 活体火山微粒
			{spellID = 176974, unitID = "player", caster = "all", filter = "BUFF"},
			-- 齐亚诺斯的剑鞘
			{spellID = 177189, unitID = "player", caster = "all", filter = "BUFF"},
			-- 泰克图斯的脉动之心
			{spellID = 177040, unitID = "player", caster = "all", filter = "BUFF"},
			-- 抽搐暗影之瓶
			{spellID = 176874, unitID = "player", caster = "all", filter = "BUFF"},
			-- 尖啸之魂号角
			{spellID = 177042, unitID = "player", caster = "all", filter = "BUFF"},
			-- 熔炉主管的徽记
			{spellID = 177096, unitID = "player", caster = "all", filter = "BUFF"},
			-- Agility Melee DPS
			-- 黑心执行者勋章
			{spellID = 176984, unitID = "player", caster = "all", filter = "BUFF"},
			-- 双面幸运金币
			{spellID = 177597, unitID = "player", caster = "all", filter = "BUFF"},
			-- 毁灭之鳞
			{spellID = 177038, unitID = "player", caster = "all", filter = "BUFF"},
			-- 多肉龙脊奖章
			{spellID = 177035, unitID = "player", caster = "all", filter = "BUFF"},
			-- 跃动的山脉之心
			{spellID = 176878, unitID = "player", caster = "all", filter = "BUFF"},
			-- 蜂鸣黑铁触发器
			{spellID = 177067, unitID = "player", caster = "all", filter = "BUFF"},
			-- Caster DPS
			-- 睡魔之袋
			{spellID = 162919, unitID = "player", caster = "all", filter = "BUFF"},
			-- 狂怒之心护符
			{spellID = 176980, unitID = "player", caster = "all", filter = "BUFF"},
			-- 虚无碎片
			{spellID = 176875, unitID = "player", caster = "all", filter = "BUFF"},
			-- 科普兰的清醒
			{spellID = 177594, unitID = "player", caster = "all", filter = "BUFF"},
			-- 髟鼠蜥人灵魂容器
			{spellID = 177046, unitID = "player", caster = "all", filter = "BUFF"},
			-- 达玛克的无常护符
			{spellID = 177051, unitID = "player", caster = "all", filter = "BUFF"},
			-- 黑铁微型坩埚
			{spellID = 177081, unitID = "player", caster = "all", filter = "BUFF"},
			-- Healer
			-- 羽翼沙漏
			{spellID = 162913, unitID = "player", caster = "all", filter = "BUFF"},
			-- 永燃蜡烛
			{spellID = 177592, unitID = "player", caster = "all", filter = "BUFF"},
			-- 完美的活性蘑菇
			{spellID = 176978, unitID = "player", caster = "all", filter = "BUFF"},
			-- 腐蚀治疗徽章
			{spellID = 176879, unitID = "player", caster = "all", filter = "BUFF"},
			-- 元素师的屏蔽护符
			{spellID = 177063, unitID = "player", caster = "all", filter = "BUFF"},
			-- 铁刺狗玩具
			{spellID = 177060, unitID = "player", caster = "all", filter = "BUFF"},
			-- 自动修复灭菌器
			{spellID = 177086, unitID = "player", caster = "all", filter = "BUFF"},

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
			-- Nitro Boosts
			{spellID = 54861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Parachute
			{spellID = 55001, unitID = "player", caster = "player", filter = "BUFF"},
			-- Goblin Glider
			{spellID = 126389, unitID = "player", caster = "player", filter = "BUFF"},

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
			-- Amplify Magic
			{spellID = 159916, unitID = "player", caster = "all", filter = "BUFF"},
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
			-- Aspect of the Fox
			{spellID = 172106, unitID = "player", caster = "all", filter = "BUFF"},
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
			Name = "R_T_AURA",
			Direction = Misc.Dright,
			Mode = "ICON",
			NumPerLine = Misc.AURAnum,
			Interval = 0,
			Alpha = 1,
			IconSize = Misc.IconSizeBig,
			Position = {unpack(Filger_Settings.R_T_AURA)},

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
			-- Incapacitating Roar
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

			-- Racial
			-- War Stomp
			{spellID = 20549, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Quaking Palm
			{spellID = 107079, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Arcane Torrent
			{spellID = 28730, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- All
			-- Warsong Flag
			{spellID = 23333, unitID = "target", caster = "all", filter = "BUFF"},
			{spellID = 23335, unitID = "target", caster = "all", filter = "BUFF"},
			-- Netherstorm Flag
			{spellID = 34976, unitID = "target", caster = "all", filter = "BUFF"},
			-- Orb of Power
			{spellID = 121175, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Carrying Seaforium
			{spellID = 66271, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Drink
			{spellID = 80167, unitID = "target", caster = "all", filter = "BUFF"},

			-- 悬锥堡
			
			-- 1 卡加斯
			-- 冲锋
			{spellID = 	158986, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 迸裂创伤
			{spellID = 	159178, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 搜寻猎物
			{spellID = 	162497, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 着火
			{spellID = 	163130, unitID = "target", caster = "all", filter = "DEBUFF"},
			
			-- 2 屠夫
			-- 捶肉槌
			{spellID = 156151, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 切肉刀
			{spellID = 156147, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 龟裂创伤
			{spellID = 156152, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 白鬼硫酸
			{spellID = 163046, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 3 泰克图斯
			-- 晶化弹幕
			{spellID = 162346, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 晶化弹幕
			{spellID = 	162370, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 4  布兰肯斯波
			-- 感染孢子
			{spellID = 163242, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 回春孢子
			{spellID = 159426, unitID = "player", caster = "all", filter = "BUFF"},
			-- 溃烂
			{spellID = 163241, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 死疽吐息
			{spellID = 159220, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 蚀脑真菌
			{spellID = 160179, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 爆裂灌注
			{spellID = 165223, unitID = "player", caster = "all", filter = "BUFF"},
			-- 脉冲高热
			{spellID = 163666, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 5  独眼魔双子
			-- 受伤
			{spellID =  155569, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烈焰
			{spellID =  158241, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 奥能动荡
			{spellID =  163372, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 奥术致伤
			{spellID =  167200, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 扭曲奥能
			{spellID =  163297, unitID = "target", caster = "all", filter = "BUFF"},

			
			-- 6 克拉戈
			-- 魔能散射：冰霜
			{spellID = 172813, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 魔能散射：火焰
			{spellID = 162185, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 魔能散射：暗影
			{spellID = 162184, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 魔能散射：奥术
			{spellID = 162186, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 压制力场
			{spellID = 161345, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 废灵标记
			{spellID = 161242, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 废灵璧垒
			{spellID = 172886, unitID = "player", caster = "all", filter = "BUFF"},
			-- 魔能散射：邪能
			{spellID = 	172895, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 魔能散射：邪能
			{spellID = 172917, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 统御之力
			{spellID = 163472, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- 7 元首
			-- 锁定
			{spellID = 157763, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 狂莽突击
			{spellID = 159515, unitID = "Target", caster = "all", filter = "BUFF"},
			-- 烙印
			{spellID = 156225, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烙印：偏移
			{spellID = 164004, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烙印：强固
			{spellID = 164005, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 烙印：复制
			{spellID = 164006, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 混沌标记
			{spellID = 158605, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 混沌标记：偏移
			{spellID = 164176, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 混沌标记：强固
			{spellID = 164178, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 混沌标记：复制
			{spellID = 164191, unitID = "player", caster = "all", filter = "DEBUFF"},
		},
	},
}