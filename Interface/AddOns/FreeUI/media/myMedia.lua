local LSM = LibStub("LibSharedMedia-3.0")
local koKR, ruRU, zhCN, zhTW, western = LSM.LOCALE_BIT_koKR, LSM.LOCALE_BIT_ruRU, LSM.LOCALE_BIT_zhCN, LSM.LOCALE_BIT_zhTW, LSM.LOCALE_BIT_western

local MediaType_BACKGROUND = LSM.MediaType.BACKGROUND
local MediaType_BORDER = LSM.MediaType.BORDER
local MediaType_FONT = LSM.MediaType.FONT
local MediaType_STATUSBAR = LSM.MediaType.STATUSBAR
-- -----
-- BACKGROUND
-- -----
LSM:Register("background", "HalBackgroundB", 			[[Interface\Addons\FreeUI\media\HalBackgroundB.tga]])
LSM:Register("background", "HalBackgroundA", 			[[Interface\Addons\FreeUI\media\HalBackgroundA.tga]])
-- -----
--  BORDER
-- ----
LSM:Register("border", "RothSquare", 					[[Interface\Addons\FreeUI\media\border_roth.tga]])
-- -----
--   FONT
-- -----
LSM:Register("font", "FruityMicrofont", 				[[Interface\Addons\FreeUI\media\FruityMicrofont.ttf]], zhCN + zhTW + western)
LSM:Register("font", "Hooge0655", 						[[Interface\Addons\FreeUI\media\Hooge0655.ttf]], zhCN + zhTW + western)
LSM:Register("font", "bm", 								[[Interface\Addons\FreeUI\media\bm.ttf]], zhCN + zhTW + western)
LSM:Register("font", "diablo", 							[[Interface\Addons\FreeUI\media\diablo.ttf]], zhCN + zhTW + western)
LSM:Register("font", "supereffective", 					[[Interface\Addons\FreeUI\media\supereffective.ttf]], zhCN + zhTW + western)
LSM:Register("font", "swfit", 							[[Interface\Addons\FreeUI\media\swfit.ttf]], zhCN + zhTW + western)
LSM:Register("font", "PFTempestaSeven", 				[[Interface\Addons\FreeUI\media\pixel.ttf]], zhCN + zhTW + western)
LSM:Register("font", "myriad semibold", 				[[Interface\Addons\FreeUI\media\font.ttf]], zhCN + zhTW + western)
LSM:Register("font", "wendy_10", 						[[Interface\Addons\FreeUI\media\wendy_10.ttf]], zhCN + zhTW + western)
-- -----
--   SOUND
-- -----
LSM:Register("sound", "bell", 							[[Interface\Addons\FreeUI\media\bell.ogg]]) 
LSM:Register("sound", "bird_flap",		 				[[Interface\Addons\FreeUI\media\bird_flap.ogg]]) 
LSM:Register("sound", "buzz", 							[[Interface\Addons\FreeUI\media\buzz.ogg]]) 
LSM:Register("sound", "cling", 							[[Interface\Addons\FreeUI\media\cling.ogg]]) 
LSM:Register("sound", "ding", 							[[Interface\Addons\FreeUI\media\ding.ogg]]) 
LSM:Register("sound", "Evangelism stacks", 				[[Interface\Addons\FreeUI\media\Evangelism stacks.ogg]]) 
LSM:Register("sound", "execute", 						[[Interface\Addons\FreeUI\media\execute.ogg]]) 
LSM:Register("sound", "Finisher", 						[[Interface\Addons\FreeUI\media\Finisher.ogg]]) 
LSM:Register("sound", "Glint", 							[[Interface\Addons\FreeUI\media\Glint.ogg]]) 
LSM:Register("sound", "LightsHammer", 					[[Interface\Addons\FreeUI\media\LightsHammer.ogg]]) 
LSM:Register("sound", "LowHealth", 						[[Interface\Addons\FreeUI\media\LowHealth.ogg]]) 
LSM:Register("sound", "LowMana", 						[[Interface\Addons\FreeUI\media\LowMana.ogg]]) 
LSM:Register("sound", "Mint", 							[[Interface\Addons\FreeUI\media\Mint.ogg]]) 
LSM:Register("sound", "miss", 							[[Interface\Addons\FreeUI\media\miss.mp3]]) 
LSM:Register("sound", "Proc", 							[[Interface\Addons\FreeUI\media\Proc.ogg]]) 
LSM:Register("sound", "ShadowOrbs", 					[[Interface\Addons\FreeUI\media\ShadowOrbs.ogg]]) 
LSM:Register("sound", "ShortCircuit", 					[[Interface\Addons\FreeUI\media\ShortCircuit.ogg]]) 
LSM:Register("sound", "Shutupfool", 					[[Interface\Addons\FreeUI\media\Shutupfool.ogg]]) 
LSM:Register("sound", "SliceDice", 						[[Interface\Addons\FreeUI\media\SliceDice.ogg]]) 
LSM:Register("sound", "sound", 							[[Interface\Addons\FreeUI\media\sound.mp3]]) 
LSM:Register("sound", "SpeedofLight", 					[[Interface\Addons\FreeUI\media\SpeedofLight.ogg]]) 
LSM:Register("sound", "Warning", 						[[Interface\Addons\FreeUI\media\Warning.ogg]]) 
LSM:Register("sound", "whisper", 						[[Interface\Addons\FreeUI\media\whisper.ogg]]) 
LSM:Register("sound", "whisper1", 						[[Interface\Addons\FreeUI\media\whisper1.ogg]]) 
LSM:Register("sound", "whisper2", 						[[Interface\Addons\FreeUI\media\whisper2.ogg]]) 
LSM:Register("sound", "swordecho", 						[[Interface\Addons\FreeUI\media\swordecho.ogg]]) 
-- -----
--   STATUSBAR
-- -----
LSM:Register("statusbar", "Texture", 			[[Interface\Addons\FreeUI\media\Texture.tga]])
LSM:Register("statusbar", "Texture0", 			[[Interface\Addons\FreeUI\media\Texture0.tga]])
LSM:Register("statusbar", "Texture1", 			[[Interface\Addons\FreeUI\media\Texture1.tga]])
LSM:Register("statusbar", "Texture2", 			[[Interface\Addons\FreeUI\media\Texture2.tga]])
LSM:Register("statusbar", "Texture3", 			[[Interface\Addons\FreeUI\media\Texture3.tga]])
LSM:Register("statusbar", "Texture4", 			[[Interface\Addons\FreeUI\media\Texture4.tga]])
LSM:Register("statusbar", "Texture5", 			[[Interface\Addons\FreeUI\media\Texture5.tga]])
LSM:Register("statusbar", "Texture6", 			[[Interface\Addons\FreeUI\media\Texture6.tga]])
LSM:Register("statusbar", "Texture7", 			[[Interface\Addons\FreeUI\media\Texture7.tga]])
LSM:Register("statusbar", "Texture8", 			[[Interface\Addons\FreeUI\media\Texture8.tga]])
LSM:Register("statusbar", "Texture9", 			[[Interface\Addons\FreeUI\media\Texture9.tga]])
LSM:Register("statusbar", "Texture10",  		[[Interface\Addons\FreeUI\media\Texture10.tga]])
LSM:Register("statusbar", "Texture11",  		[[Interface\Addons\FreeUI\media\Texture11.tga]])
