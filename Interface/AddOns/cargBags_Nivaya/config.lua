local addon, ns = ...
ns.options = {

itemSlotSize = 32,	-- Size of item slots

sizes = {
	bags = {
		columnsSmall = 10,
		columnsLarge = 10,
		largeItemCount = 64,	-- Switch to columnsLarge when >= this number of items in your bags
	},
	bank = {
		columnsSmall = 14,
		columnsLarge = 14,
		largeItemCount = 96,	-- Switch to columnsLarge when >= this number of items in the bank
	},	
},

}