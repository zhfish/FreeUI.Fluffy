local addon, ns = ...
ns.options = {

itemSlotSize = 34,	-- Size of item slots

sizes = {
	bags = {
		columnsSmall = 8,
		columnsLarge = 8,
		largeItemCount = 114,	-- Switch to columnsLarge when >= this number of items in your bags
	},
	bank = {
		columnsSmall = 9,
		columnsLarge = 66,
		largeItemCount = 196,	-- Switch to columnsLarge when >= this number of items in the bank
	},	
},


--------------------------------------------------------------
-- Anything below this is only effective when not using RealUI
--------------------------------------------------------------

fonts = {
	-- Font to use for bag captions and other strings
	pixel = {
		"Interface\\AddOns\\cargBags_Nivaya\\media\\pixel.ttf", 	-- Font path
		8, 						-- Font Size
		"OUTLINEMONOCHROME",	-- Flags
	},
},

colors = {
	background = {0, 0, 0, .75},	-- r, g, b, opacity
},


}