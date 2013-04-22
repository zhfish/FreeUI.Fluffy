local _, sakaras = ...
local Misc = sakaras.FilgerSettings

Filger_Settings = {
	config_mode = false,		
	max_test_icon = 3,		

	player_buff_icon = {"CENTER", UIParent, "CENTER", 15, -110},				-- player's buff
	player_special_buff_icon = {"CENTER", UIParent, "CENTER", -15, -110},		-- special buff on player
	player_cooldown_icon = {"RIGHT", UIParent, "CENTER", -260, -240},			-- player cooldown
	target_debuff_icon = {"BOTTOMLEFT", UIParent, "CENTER", 120, 0},			-- target's debuff
	target_buff_icon = {"CENTER", UIParent, "CENTER", 0, 220},					-- target's buff 'PVP'
	player_debuff_pvp = {"CENTER", UIParent, "CENTER", -100, 40},				-- debuff on player 'CC'
	pve_alert = {"CENTER", UIParent, "CENTER", -100, -10}						-- raid alert 'PVE'



}

Filger_Spells = {



	["WARLOCK"] = {

		{
			Name = "P_BUFF",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 28,
			Position = {unpack(Filger_Settings.player_buff_icon)},


			-- Buffs
			-- Backdraft
			{spellID = 117828, unitID = "player", caster = "player", filter = "BUFF"},
			-- Backlash
			{spellID = 34936, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nightfall
			{spellID = 108558, unitID = "player", caster = "player", filter = "BUFF"},
			-- Demonic Rebirth
			{spellID = 108559, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shadow Trance
			{spellID = 17941, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Soul
			{spellID = 74434, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Knowledge
			{spellID = 113861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Misery
			{spellID = 113860, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Soul: Instability
			{spellID = 113858, unitID = "player", caster = "player", filter = "BUFF"},
			-- Unending Resolve
			{spellID = 104773, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Bargain
			{spellID = 110913, unitID = "player", caster = "player", filter = "BUFF"},
			-- Twilight Ward
			{spellID = 6229, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Swap
			{spellID = 86211, unitID = "player", caster = "player", filter = "BUFF"},
			-- Burning Rush
			{spellID = 111400, unitID = "player", caster = "player", filter = "BUFF"},
			-- Dark Regeneration
			{spellID = 108359, unitID = "player", caster = "player", filter = "BUFF"},
			-- Sacrificial Pact
			{spellID = 108416, unitID = "player", caster = "player", filter = "BUFF"},
			-- Soul Link
			{spellID = 108415, unitID = "player", caster = "player", filter = "BUFF"},
			-- Fire and Brimstone
			{spellID = 108683, unitID = "player", caster = "player", filter = "BUFF"},
			-- blood horror
			{spellID = 111397, unitID = "player", caster = "player", filter = "BUFF"},
			-- Shadow Bulwark
			{spellID = 132413, unitID = "player", caster = "player", filter = "BUFF"},


		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 32,
			Position = {unpack(Filger_Settings.target_debuff_icon)},


			-- Self
			-- Curse of the Elements
			{spellID = 1490, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Curse of Exhaustion
			{spellID = 18223, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Curse of Enfeeblement
			{spellID = 109466, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Enslave Demon
			{spellID = 1098, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Shadowsnare
			{spellID = 63311, unitID = "target", caster = "player", filter = "DEBUFF"},

			-- Havoc
			{spellID = 80240, unitID = "target", caster = "player", filter = "DEBUFF"},	

			-- CoE group
			-- Master Poisoner (Rogue)
			{spellID = 93068, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Lightning Breath (Wind Serpent)
			{spellID = 24844, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fire Breath (Dragonhawk)
			{spellID = 34889, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Doom
			{spellID = 603, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Agony
			{spellID = 980, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Corruption
			{spellID = 172, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Seed of Corruption
			{spellID = 27243, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Immolate
			{spellID = 348, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 30108, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Haunt
			{spellID = 48181, unitID = "target", caster = "player", filter = "DEBUFF"},

			-- Fear
			{spellID = 5782, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Blood Fear
			{spellID = 111397, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Banish
			{spellID = 710, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, unitID = "target", caster = "player", filter = "DEBUFF"},
			-- Mortal Coil
			{spellID = 6789, unitID = "target", caster = "player", filter = "DEBUFF"},

		},
		{
			Name = "P_COOLDOWN",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 32,
			Position = {unpack(Filger_Settings.player_cooldown_icon)},

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
			-- Twilight Ward
			{spellID = 6229, filter = "CD"},
			-- Sacrifice (Voidwalker)
			{spellID = 7812, filter = "CD"},
			-- Demonic Circle: Teleport
			{spellID = 48020, filter = "CD"},
			-- Grimoire of Service
			{spellID = 108501, filter = "CD"},
			-- dark soul misery
			{spellID = 113860, filter = "CD"},
			-- Unending Resolve
			{spellID = 104773, filter = "CD"},
			-- Dark Bargain
			{spellID = 110913, filter = "CD"},
			-- Soul Swap
			{spellID = 86211, filter = "CD"},
			-- Archimonde's Vengeance
			{spellID = 108505, filter = "CD"},
			-- Dark Regeneration
			{spellID = 108359, filter = "CD"},
			-- Blood Fear
			{spellID = 111397, filter = "CD"},
			-- Racial
			-- Will of the Forsaken (Forsaken)
			{spellID = 7744, filter = "CD"},
			-- Cannibalize (Forsaken)
			{spellID = 20577, filter = "CD"},
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
			-- potion of jade serpent
			{spellID = 105702, filter = "ICD", trigger = "BUFF", duration = 60},
			-- Internal
			-- Lightweave
			{spellID = 125487, filter = "ICD", trigger = "BUFF", duration = 60},
			-- Jade Spirit
--			{spellID = 104993, filter = "ICD", trigger = "BUFF", duration = 50},
			-- Light of the Cosmos
			{spellID = 126577, filter = "ICD", trigger = "BUFF", duration = 45},
			-- yu'lon
			{spellID = 128985, filter = "ICD", trigger = "BUFF", duration = 50},
			-- Volatile Talisman of the Shado-Pan Assault
			{spellID = 138703, filter = "ICD", trigger = "BUFF", duration = 45},
			

		},

	},

	["HUNTER"] = {

		{
			Name = "P_BUFF",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 28,
			Position = {unpack(Filger_Settings.player_buff_icon)},


			-- Buffs
			-- thrill
			{spellID = 34720, unitID = "player", caster = "player", filter = "BUFF"},


		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 32,
			Position = {unpack(Filger_Settings.target_debuff_icon)},


			-- Self
			-- Curse of the Elements
			{spellID = 1490, unitID = "target", caster = "all", filter = "DEBUFF"},

		},
		{
			Name = "P_COOLDOWN",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 32,
			Position = {unpack(Filger_Settings.player_cooldown_icon)},

			-- Self
			-- Devour Magic (Felhunter)
			{spellID = 19505, filter = "CD"},
		},

	},

	["ALL"] = {
		{
			Name = "SPECIAL_P_BUFF_ICON",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 28,
			Position = {unpack(Filger_Settings.player_special_buff_icon)},


			-- Potions
			-- Virmen's Bite
			{spellID = 105697, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potion of Mogu Power
			{spellID = 105706, unitID = "player", caster = "player", filter = "BUFF"},
			-- Potion of the Jade Serpent
			{spellID = 105702, unitID = "player", caster = "player", filter = "BUFF"},
			-- Speed (Potion)
			{spellID = 2379, unitID = "player", caster = "all", filter = "BUFF", absID = true},
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

			-- Engineering
			-- Synapse Springs
			{spellID = 126734, unitID = "player", caster = "player", filter = "BUFF"},
			-- Phase Fingers
			{spellID = 108789, unitID = "player", caster = "player", filter = "BUFF"},
			-- Nitro Boosts
			{spellID = 54861, unitID = "player", caster = "player", filter = "BUFF"},
			-- Parachute
			{spellID = 55001, unitID = "player", caster = "player", filter = "BUFF"},

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
			-- Lifeblood
			{spellID = 74497, unitID = "player", caster = "player", filter = "BUFF"},
			-- Lightwell Renew
			{spellID = 7001, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Protection
			{spellID = 1022, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Freedom
			{spellID = 1044, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Salvation
			{spellID = 1038, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Sacrifice
			{spellID = 6940, unitID = "player", caster = "all", filter = "BUFF"},
			-- Hand of Purity
			{spellID = 114039, unitID = "player", caster = "all", filter = "BUFF"},
			-- Devotion Aura
			{spellID = 31821, unitID = "player", caster = "all", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, unitID = "player", caster = "all", filter = "BUFF"},
			-- Guardian Spirit
			{spellID = 47788, unitID = "player", caster = "all", filter = "BUFF"},
			-- Life Cocoon
			{spellID = 116849, unitID = "player", caster = "all", filter = "BUFF"},
			-- Unholy Frenzy
			{spellID = 49016, unitID = "player", caster = "all", filter = "BUFF"},
			-- Tricks of the Trade
			{spellID = 57933, unitID = "player", caster = "all", filter = "BUFF"},
			-- Rallying Cry
			{spellID = 97462, unitID = "player", caster = "all", filter = "BUFF"},
			-- Stampeding Roar
			{spellID = 77764, unitID = "player", caster = "all", filter = "BUFF"},
			-- Grounding Totem
			{spellID = 8178, unitID = "player", caster = "all", filter = "BUFF"},
			-- Innervate
			{spellID = 29166, unitID = "player", caster = "all", filter = "BUFF"},
			-- Slow Fall
			{spellID = 130, unitID = "player", caster = "all", filter = "BUFF"},
			-- Levitate
			{spellID = 1706, unitID = "player", caster = "all", filter = "BUFF"},
			-- Body and Soul
			{spellID = 65081, unitID = "player", caster = "all", filter = "BUFF"},
			-- Angelic Feather
			{spellID = 121557, unitID = "player", caster = "all", filter = "BUFF"},
			-- Stormlash Totem
			{spellID = 120676, unitID = "player", caster = "all", filter = "BUFF"},
			-- Tiger's Lust
			{spellID = 116841, unitID = "player", caster = "all", filter = "BUFF"},


			-- yu'lon
			{spellID = 128985, unitID = "player", caster = "all", filter = "BUFF"},
			-- light of the cosmos
			{spellID = 126577, unitID = "player", caster = "all", filter = "BUFF"},
			-- Jade Spirit
			{spellID = 104993, unitID = "player", caster = "all", filter = "BUFF"},
			-- acceleration
			{spellID = 138703, unitID = "player", caster = "all", filter = "BUFF"},
			-- breath of the hydra 
			{spellID = 138898, unitID = "player", caster = "all", filter = "BUFF"},
			-- Cha-Ye's Essence of Brilliance
			{spellID = 139133, unitID = "player", caster = "all", filter = "BUFF"},
		},
		{
			Name = "PVP_P_DEBUFF",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 38,
			Position = {unpack(Filger_Settings.player_debuff_pvp)},

			-- Other
			-- Rocket Fuel Leak
			{spellID = 94794, unitID = "player", caster = "player", filter = "DEBUFF"},
		},
		{
			Name = "T_BUFF",
			Direction = "RIGHT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 44,
			Position = {unpack(Filger_Settings.target_buff_icon)},


			-- Death knight
			-- Anti-Magic Shell
			{spellID = 48707, unitID = "target", caster = "all", filter = "BUFF"},
			-- Lichborne
			{spellID = 49039, unitID = "target", caster = "all", filter = "BUFF"},
			-- Icebound Fortitude
			{spellID = 48792, unitID = "target", caster = "all", filter = "BUFF"},
			-- Pillar of Frost
			{spellID = 51271, unitID = "target", caster = "all", filter = "BUFF"},
			-- Unholy Frenzy
			{spellID = 49016, unitID = "target", caster = "all", filter = "BUFF"},
			-- Death's Advance
			{spellID = 96268, unitID = "target", caster = "all", filter = "BUFF"},

			-- Gnaw (Pet)
			{spellID = 47481, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Monstrous Blow (Pet - mutant)
			{spellID = 91797, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Asphyxiate
			{spellID = 108194, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Remorseless Winter
			{spellID = 115001, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Strangulate
			{spellID = 47476, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Druid
			-- Innervate
			{spellID = 29166, unitID = "target", caster = "all", filter = "BUFF"},
			-- Barkskin
			{spellID = 22812, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ironbark
			{spellID = 102342, unitID = "target", caster = "all", filter = "BUFF"},
			-- Nature's Grasp
			{spellID = 16689, unitID = "target", caster = "all", filter = "BUFF"},
			-- Stampeding Roar
			{spellID = 77764, unitID = "target", caster = "all", filter = "BUFF"},
			-- Survival Instincts
			{spellID = 61336, unitID = "target", caster = "all", filter = "BUFF"},
			-- Incarnation: Tree of Life
			{spellID = 117679, unitID = "target", caster = "all", filter = "BUFF"},
			-- Berserk
			{spellID = 50334, unitID = "target", caster = "all", filter = "BUFF"},

			-- Cyclone
			{spellID = 33786, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Hibernate
			{spellID = 2637, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mighty Bash
			{spellID = 5211, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Bear Hug
			{spellID = 102795, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Maim
			{spellID = 22570, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Pounce
			{spellID = 9005, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Disorienting Roar
			{spellID = 99, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Solar Beam
			{spellID = 78675, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Entangling Roots
			{spellID = 339, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Hunter
			-- Aspect of the Pack
			{spellID = 13159, unitID = "target", caster = "all", filter = "BUFF"},
			-- Aspect of the Cheetah
			{spellID = 5118, unitID = "target", caster = "all", filter = "BUFF"},
			-- Deterrence
			{spellID = 19263, unitID = "target", caster = "all", filter = "BUFF"},

			-- Intimidation
			{spellID = 24394, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Freezing Trap
			{spellID = 3355, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Scare Beast
			{spellID = 1513, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Scatter Shot
			{spellID = 19503, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Wyvern Sting
			{spellID = 19386, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Silencing Shot
			{spellID = 34490, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Sonic Blast (Bat)
			{spellID = 50519, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Sting (Wasp)
			{spellID = 56626, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Bad Manner (Monkey)
			{spellID = 90337, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Pin (Crab)
			{spellID = 50245, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Venom Web Spray (Silithid)
			{spellID = 54706, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Web (Spider)
			{spellID = 4167, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Nether Shock (Nether Ray)
			{spellID = 44957, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Mage
			-- Ice Block
			{spellID = 45438, unitID = "target", caster = "all", filter = "BUFF"},
			-- Invisibility
			{spellID = 66, unitID = "target", caster = "all", filter = "BUFF"},
			-- Evocation
			{spellID = 12051, unitID = "target", caster = "all", filter = "BUFF"},
			-- Temporal Shield
			{spellID = 115610, unitID = "target", caster = "all", filter = "BUFF"},

			-- Cauterize
			{spellID = 87023, unitID = "target", caster = "target", filter = "DEBUFF"},
			-- Deep Freeze
			{spellID = 44572, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Polymorph
			{spellID = 118, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Ring of Frost
			{spellID = 82691, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Dragon's Breath
			{spellID = 31661, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Combustion Impact
			{spellID = 118271, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Frostjaw
			{spellID = 102051, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Silenced - Improved Counterspell
			{spellID = 55021, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Monk
			-- Touch of Karma
			{spellID = 125174, unitID = "target", caster = "target", filter = "BUFF"},

			-- Fists of Fury
			{spellID = 113656, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Leg Sweep
			{spellID = 119381, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Paralysis
			{spellID = 115078, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Charging Ox Wave
			{spellID = 119392, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Clash
			{spellID = 122242, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Paladin
			-- Divine Shield
			{spellID = 642, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Protection
			{spellID = 1022, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Sacrifice
			{spellID = 6940, unitID = "target", caster = "all", filter = "BUFF"},
			-- Hand of Freedom
			{spellID = 1044, unitID = "target", caster = "all", filter = "BUFF"},
			-- Devotion Aura
			{spellID = 31821, unitID = "target", caster = "all", filter = "BUFF"},
			-- Ardent Defender
			{spellID = 31850, unitID = "target", caster = "all", filter = "BUFF"},
			-- Divine Protection
			{spellID = 498, unitID = "target", caster = "all", filter = "BUFF"},
			-- Guardian of Ancient Kings
			{spellID = 86698, unitID = "target", caster = "all", filter = "BUFF"},

			-- Hammer of Justice
			{spellID = 853, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fist of Justice
			{spellID = 105593, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Repentance
			{spellID = 20066, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Avenger's Shield
			{spellID = 31935, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Priest
			-- Dispersion
			{spellID = 47585, unitID = "target", caster = "all", filter = "BUFF"},
			-- Pain Suppression
			{spellID = 33206, unitID = "target", caster = "all", filter = "BUFF"},
			-- Power Infusion
			{spellID = 10060, unitID = "target", caster = "all", filter = "BUFF"},
			-- Glyph of Inner Focus
			{spellID = 96267, unitID = "target", caster = "all", filter = "BUFF"},
			-- Guardian Spirit
			{spellID = 47788, unitID = "target", caster = "all", filter = "BUFF"},
			-- Fear Ward
			{spellID = 6346, unitID = "target", caster = "all", filter = "BUFF"},
			-- phantasm
			{spellID = 114239, unitID = "target", caster = "all", filter = "BUFF"},

			-- Psychic Horror
			{spellID = 64044, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Dominate Mind
			{spellID = 605, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Psychic Scream
			{spellID = 8122, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Silence
			{spellID = 15487, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Glyph of Mind Blast
			{spellID = 87194, unitID = "target", caster = "all", filter = "DEBUFF"},

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

			-- Hex
			{spellID = 51514, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Bind Elemental
			{spellID = 76780, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Static Charge
			{spellID = 118905, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Warlock
			-- Unending Resolve
			{spellID = 104773, unitID = "target", caster = "all", filter = "BUFF"},
			-- Dark Bargain
			{spellID = 110913, unitID = "target", caster = "all", filter = "BUFF"},
			-- Soulstone
			{spellID = 20707, unitID = "target", caster = "all", filter = "BUFF"},

			-- Banish
			{spellID = 710, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Shadowfury
			{spellID = 30283, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Axe Toss (Felguard)
			{spellID = 89766, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Fear
			{spellID = 5782, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Howl of Terror
			{spellID = 5484, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Mortal Coil
			{spellID = 6789, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Seduction (Succubus)
			{spellID = 6358, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Unstable Affliction
			{spellID = 31117, unitID = "target", caster = "all", filter = "DEBUFF", absID = true},
			-- Spell Lock (Felhunter)
			{spellID = 24259, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Warrior
			-- Spell Reflection
			{spellID = 23920, unitID = "target", caster = "all", filter = "BUFF"},
			-- Mass Spell Reflection
			{spellID = 114028, unitID = "target", caster = "all", filter = "BUFF"},
			-- Shield Wall
			{spellID = 871, unitID = "target", caster = "all", filter = "BUFF"},
			-- Berserker Rage
			{spellID = 18499, unitID = "target", caster = "all", filter = "BUFF"},
			-- Last Stand
			{spellID = 12975, unitID = "target", caster = "all", filter = "BUFF"},
			-- Bladestorm
			{spellID = 46924, unitID = "target", caster = "all", filter = "BUFF"},
			-- Rallying Cry
			{spellID = 97462, unitID = "target", caster = "all", filter = "BUFF"},

			-- Storm Bolt
			{spellID = 107570, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Shockwave
			{spellID = 46968, unitID = "target", caster = "all", filter = "DEBUFF"},
			-- Intimidating Shout
			{spellID = 20511, unitID = "target", caster = "all", filter = "DEBUFF"},
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
			-- Seaforium
			{spellID = 52418, unitID = "target", caster = "all", filter = "BUFF"},
			{spellID = 66271, unitID = "target", caster = "all", filter = "DEBUFF"},

			-- Drink
			{spellID = 80167, unitID = "target", caster = "all", filter = "BUFF"},
		},
		{
			Name = "PVE_ALERT",
			Direction = "LEFT",
			Mode = "ICON",
			Interval = 1,
			Alpha = 1,
			IconSize = 44,
			Position = {unpack(Filger_Settings.pve_alert)},

			-- mop raid
			-- [[ HEART OF FEAR ]] --
			-- Imperial Vizier Zor'lok
			-- Exhale
			{spellID = 122761, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Convert
			{spellID = 122740, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Blade Lord Ta'yak
			-- Overwhelming Assault
			{spellID = 123474, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Windstep
			{spellID = 123180, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Garalon
			-- Pheromones
			{spellID = 122835, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- pungency
			{spellID = 123081, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Weak Points
			{spellID = 123428, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Wind Lord Mel'Jarak
			-- Amber Prison
			{spellID = 121876, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Corrosive Resin
			{spellID = 122064, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- recklessness
			{spellID = 125873, unitID = "target", caster = "all", filter = "BUFF"},
			
			-- Amber-Shaper Un'sok
			-- Burning Amber
			{spellID = 122504, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Parasitic Growth
			{spellID = 121949, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Mutated Construct -- Need to get an ID when MoP is live
			-- Amber Strike
			{spellID = 122389, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fling
			{spellID = 122413, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Amber Globule
			{spellID = 125498, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 动摇意志
			{spellID = 123059, unitID = "target", caster = "all", filter = "DEBUFF"},
			
			-- Grand Empress Shek'zeer
			-- Eyes of the Empress
			{spellID = 123707, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fixate -- Need to get an ID when MoP is live
			-- Sticky Resin
			{spellID = 124097, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Poison-Drenched Armor
			{spellID = 124821, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Consuming Terror
			{spellID = 124849, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Visions of Demise
			{spellID = 124862, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Heart of Fear
			{spellID = 123845, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- [[ MOGU'SHAN VAULTS ]] --
			-- The Stone Guard
			-- Jasper Chains
			{spellID = 130395, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Cobalt Mine Blast
			{spellID = 116281, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Feng the Accursed
			-- Lightning Last
			{spellID = 131788, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Arcane Shock
			{spellID = 131790, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shadowburn
			{spellID = 131792, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Wildfire Spark
			{spellID = 116784, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Arcane Resonance
			{spellID = 116417, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Nullification Barrier
			{spellID = 115856, unitID = "player", caster = "all", filter = "BUFF"},

			
			-- Garajal the Spiritbinder
			-- Spiritual Innervation
			{spellID = 117549, unitID = "player", caster = "all", filter = "BUFF"},
			-- Voodoo Dolls
			{spellID = 122151, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Crossed Over
			{spellID = 116161, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Frail Soul
			{spellID = 117723, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- The Spirit Kings
			-- Maddening Shout
			{spellID = 117708, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fixate
			{spellID = 118303, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Pillaged
			{spellID = 118048, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Pinned Down
			{spellID = 118135, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Robbed Blind
			{spellID = 118163, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Shield of Darkness
			{spellID = 117697, unitID = "target", caster = "all", filter = "BUFF"},
			-- Impervious Shield
			{spellID = 117961, unitID = "target", caster = "all", filter = "BUFF"},
			-- Sleight of Hand
			{spellID = 118162, unitID = "target", caster = "all", filter = "BUFF"},

			
			-- Elegon
			-- Overcharged
			{spellID = 117878, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Closed Circuit
			{spellID = 117949, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Energy Cascade
			{spellID = 119722, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Will of the Emperor
			-- Focused Assault
			{spellID = 116525, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Focused Defense
			{spellID = 116778, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Focused Energy
			{spellID = 116829, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- [[ TERRACE OF ENDLESS SPRING ]] --
			-- Protector of the Endless
			-- Touch of Sha
			{spellID = 117519, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Corrupted Essence
			{spellID = 118191, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Purified
			{spellID = 117235, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Lightning Prison
			{spellID = 111850, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Lightning Prison
			{spellID = 117436, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Tsulong
			-- Dread Shadows
			{spellID = 122768, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Nightmares
			{spellID = 122777, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fright
			{spellID = 123036, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Sunbeam
			{spellID = 122789, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Terrorize
			{spellID = 123011, unitID = "player", caster = "all", filter = "DEBUFF"},
			
			-- Lei Shi
			-- Spray
			{spellID = 123121, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Scary Fog
			{spellID = 123705, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- Sha of Fear
			-- Fearless
			{spellID = 118977, unitID = "player", caster = "all", filter = "BUFF"},
			-- Penetrating Bolt
			{spellID = 119086, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Huddle in Terror
			{spellID = 120629, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- waterspout
			{spellID = 120519, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- waterspout
			{spellID = 120519, unitID = "player", caster = "all", filter = "DEBUFF"},

			-- tot
			-- Jin'rokh the Breaker
			-- 电离反应
			{spellID = 138732, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 专注闪电
			{spellID = 137422, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 浸电之水
			{spellID = 138006, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Fluidity
			{spellID = 138002, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- tortos
			-- 水晶龟壳
			{spellID = 137633, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- JI Kun
			-- 原始营养
			{spellID = 140741, unitID = "player", caster = "all", filter = "BUFF"},
			-- 飞行
			{spellID = 133755, unitID = "player", caster = "all", filter = "BUFF"},
			-- iron Qon
			-- 弧形闪电
			{spellID = 136193, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 炙燃余烬
			{spellID = 137668, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 风暴雷云
			{spellID = 137669, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 攻击盲区
			{spellID = 135147, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 冻结之血
			{spellID = 137664, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- Council of Elders
			-- 刺骨之寒
			{spellID = 136992, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 霜寒刺骨
			{spellID = 136922, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 诱捕
			{spellID = 136878, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 流沙
			{spellID = 136860, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 定身
			{spellID = 136857, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 灵魂残片
			{spellID = 137641, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 暗影之魂
			{spellID = 137650, unitID = "player", caster = "all", filter = "DEBUFF"},
			-- 身体过热
			{spellID = 137084, unitID = "player", caster = "all", filter = "DEBUFF"},

		},
	},
}