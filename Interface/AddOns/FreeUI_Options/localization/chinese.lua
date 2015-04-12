local _, ns = ...

if ns.locale ~= "zhCN" and ns.locale ~= "zhTW" then return end

ns.localization.profile = "角色单独配置"
ns.localization.profileTooltip = "在角色单独配置和公共配置之间切换。"
ns.localization.credits = "致谢"
ns.localization.install = "安装"
ns.localization.needReload = "重载界面来应用改动。"
ns.localization.needReloadPopup = "你需要重载界面来使改动生效。\n\n现在就重载界面么？"
ns.localization.requiresReload = "这个选项需要重载界面来生效。"
ns.localization.reload = "重载界面"
ns.localization.resetData = "移除数据"
ns.localization.resetDataTooltip = "移除所有已保存的数据，例如你的角色共有多少金币。"
ns.localization.resetOptions = "移除已保存的数据"
ns.localization.resetOptionsTooltip = "移除所有已保存的数据，重置为默认值。"
ns.localization.resetCharBox = "移除这个角色已保存的数据："
ns.localization.layoutText = "使用下面的按钮来转换到其他界面布局。\n你也可以使用命令行'/freeui dps' 或者 '/freeui heal'"
ns.localization.notificationPreviewText = "这是一个通知示例。"
ns.localization.notificationPreviewCallbackText = "大多数通知都有相关的点击动作。"
ns.localization.author = "FreeUI by Haleth on wowinterface.com"
ns.localization.authorSubText = "Lightsword @ Argent Dawn - EU"
ns.localization.NEW = "NEW!"

ns.localization.general = "综合"
ns.localization.generalSubText = "这些选项控制这个界面的大部分通用设置。"
ns.localization.generalFeatures = "特性"
ns.localization.generalMisc = "杂项"
ns.localization.generalobjectivetracker = "美化任务追踪"
ns.localization.generalobjectivetrackerTooltip = "如果要使用其他任务追踪类插件请先禁用这个选项。"
ns.localization.generalAuraTracker = "Aura Tracker (Filger)"
ns.localization.generalAuraTrackerTooltip = "监视重要的 Buff/Debuff，基于 Filger。"
ns.localization.generalAuraTracker_testmod = "测试模式"
ns.localization.generalAuraTracker_testmodTooltip = "进入测试模式方便调整图标位置。"
ns.localization.generalbiggertradeskillui = "商业技能面板增强"
ns.localization.generalbiggertradeskilluiTooltip = "商业技能面板调整，更大更容易使用。"
ns.localization.generaltradetab = "Trade Tab"
ns.localization.generaltradetabTooltip = "Add spellbook-like tabs to the TradeSkillFrame, it will add one for each of your professions and one for each of the profession 'suppliment' abilities (cookfire, disenchant, milling, etc)."
ns.localization.generalcooldownpulse = "冷却提示"
ns.localization.generalcooldownpulseTooltip = "当技能冷却完毕时在屏幕中央闪动图标。"
ns.localization.generalscreenshot = "成就截图"
ns.localization.generalscreenshotTooltip = "获得成就时自动截图。"
ns.localization.generalhelmcloakbuttons = "头盔/披风显示按钮"
ns.localization.generalhelmcloakbuttonsTooltip = "使你可以在角色面板显示或隐藏头盔/披风。"
ns.localization.generalinterrupt = "打断提示"
ns.localization.generalinterruptTooltip = "在特定场合和情况下通告打断"
ns.localization.generalinterrupt_sound = "声音提示"
ns.localization.generalinterrupt_soundTooltip = "成功打断时播放一个声音提示。"
ns.localization.generalinterrupt_party = "小队"
ns.localization.generalinterrupt_partyTooltip = "启用打断通告当你在5人小队和场景战役时（场景战役只有在勾选了副本选项时才会生效）。"
ns.localization.generalinterrupt_bgs = "战场"
ns.localization.generalinterrupt_bgsTooltip = "启用打断通告当你在战场时。"
ns.localization.generalinterrupt_lfg = "副本"
ns.localization.generalinterrupt_lfgTooltip = "启用打断通告当你在副本队伍时。"
ns.localization.generalinterrupt_outdoors = "野外"
ns.localization.generalinterrupt_outdoorsTooltip = "启用打断通告当你不在任何副本时。"
ns.localization.generalmailButton = "邮件一键收取"
ns.localization.generalmailButtonTooltip = "在邮件界面添加一个按钮来一键收取所有邮件。"
ns.localization.generalnameplates = "姓名板"
ns.localization.generalnameplatesTooltip = "美化默认姓名板外观。禁用这个选项如果你想使用另外的姓名板插件。"
ns.localization.generalrareAlert = "稀有通知"
ns.localization.generalrareAlertTooltip = "发现稀有或宝藏时显示一个声音(可选)提醒，小地图上有具体位置。"
ns.localization.generalrareAlert_playSound = "播放声音"
ns.localization.generalthreatMeter = "仇恨值"
ns.localization.generalthreatMeterTooltip = "在目标框体上添加一个仇恨计量条，当你是坦克时显示第二仇恨的名字和仇恨量，当你是输出时显示你和坦克的仇恨对比。"
ns.localization.generaluiScaleAuto = "强制优化界面缩放"
ns.localization.generaluiScaleAutoTooltip = "自动为你的分辨率使用最优化的界面缩放。"
ns.localization.generalundressButton = "脱衣按钮"
ns.localization.generalundressButtonTooltip = "在试衣间界面添加一键脱光按钮"

ns.localization.appearance = "外观"
ns.localization.appearanceSubText = "改变部分外观"
ns.localization.appearanceColours = "颜色"
ns.localization.appearanceFonts = "字体"
ns.localization.appearancecolourScheme = "颜色方案"
ns.localization.appearancecolourScheme1 = "职业染色"
ns.localization.appearancecolourScheme2 = "自定义"
ns.localization.appearancecolourScheme1Tooltip = "自动根据你的职业来染色。"
ns.localization.appearancecolourScheme2Tooltip = "选择自定义颜色"
ns.localization.appearancechooseColour = "选择..."
ns.localization.appearancefontUseAlternativeFont = "使用备选字体"
ns.localization.appearancefontUseAlternativeFontTooltip = "使用聊天框的字体来替换界面默认的像素字体。"
ns.localization.appearancefontSizeNormal = "普通字体"
ns.localization.appearancefontSizeLarge = "大号字体"
ns.localization.appearancefontOutline = "字体描边"
ns.localization.appearancefontOutlineStyle = "描边"
ns.localization.appearancefontOutlineStyle1 = "普通"
ns.localization.appearancefontOutlineStyle2 = "单色"
ns.localization.appearancefontOutlineStyle1Tooltip = "搭配普通字体使用（非像素型字体）"
ns.localization.appearancefontOutlineStyle2Tooltip = "搭配像素字体使用"
ns.localization.appearancefontShadow = "阴影"
ns.localization.appearancesampleText = "示例文字"

ns.localization.automation = "便利功能"
ns.localization.automationSubText = "这些设置帮助你自动执行一些常用动作"
ns.localization.automationautoAccept = "自动接受好友或公会成员的组队邀请"
ns.localization.automationautoRepair = "自动修理"
ns.localization.automationautoRepair_guild = "优先使用公会修理"
ns.localization.automationautoRoll = "自动选择分解或贪婪装绑的绿装"
ns.localization.automationautoRoll_maxLevel = "仅在满级时生效"
ns.localization.automationautoSell = "自动售卖垃圾"
ns.localization.automationautoSellTooltip = "自动售卖货色品质物品，除非它属于自定义套装"
ns.localization.automationquestRewardHighlight = "任务奖励高亮"
ns.localization.automationquestRewardHighlightTooltip = "交任务时高亮最贵的奖励"
ns.localization.automationautoSetRole = "跳过不必要的职责确认"
ns.localization.automationautoSetRoleTooltip = "当你已经选择职责，或为纯DPS职业时跳过职责确认"
ns.localization.automationautoSetRole_useSpec = "依据当前天赋确定职责"
ns.localization.automationautoSetRole_useSpecTooltip = "总是依据你的当前天赋确定职责，不再提示职责确认窗口"
ns.localization.automationautoSetRole_verbose = "通告模式"
ns.localization.automationautoSetRole_verboseTooltip = "当跳过职责确认时发出通告"

ns.localization.actionbars = "动作条"
ns.localization.actionbarsSubText = "动作条以及按钮设置"
ns.localization.actionbarsenable = "启用"
ns.localization.actionbarsenableTooltip = "禁用这个选项如果你想使用默认动作条"
ns.localization.actionbarsenableStyle = "启用动作条样式"
ns.localization.actionbarsenableStyleTooltip = "使用其他动作条插件时禁用此项以保证兼容"
ns.localization.actionbarshotkey = "显示快捷键绑定"
ns.localization.actionbarsrightbars_mouseover = "鼠标滑过显示右侧动作条"

ns.localization.bags = "背包"
ns.localization.bagsSubText = "选择设置你喜欢的样式"
ns.localization.bagsGeneral = "通用设置"
ns.localization.bagsStyleSpecific = "样式"
ns.localization.bagssize = "背包大小"
ns.localization.bagsstyle = "背包样式"
ns.localization.bagsstyle1 = "所有背包合一"
ns.localization.bagsstyle2 = "美化默认背包"
ns.localization.bagsstyle3 = "禁用"
ns.localization.bagsslotsShowAlways = "显示物品格子"
ns.localization.bagsslotsShowAlwaysTooltip = "启用这个选项来显示背包格子"
ns.localization.bagshideSlots = "隐藏背包条"
ns.localization.bagshideSlotsTooltip = "禁用这个选项当你想添加移除背包时"

ns.localization.menubar = "菜单条"
ns.localization.menubarSubText = "信息条位于屏幕底部的面板，移动鼠标显示额外的功能和信息"
ns.localization.menubarenable = "启用"
ns.localization.menubarenableButtons = "启用按钮"
ns.localization.menubarenableButtonsTooltip = "在菜单条上显示按钮"
ns.localization.menubarbuttons_mouseover = "鼠标滑过显示按钮"
ns.localization.menubarbuttons_mouseoverTooltip = "只在鼠标滑过时显示按钮"

ns.localization.notifications = "通知功能"
ns.localization.notificationsSubText = "设置通知功能"
ns.localization.notificationsWhen = "通知时机"
ns.localization.notificationsHow = "通知方式"
ns.localization.notificationsPreview = "预览"
ns.localization.notificationsenable = "启用"
ns.localization.notificationsenableTooltip = "允许显示通知栏将会在界面上方显示通知条，通过鼠标任何按键点击均可以隐藏。左键点击它可激活某些动作，如显示日历。"
ns.localization.notificationsplaySounds = "声音提示"
ns.localization.notificationsplaySoundsTooltip = "当出现通知时播放声音提示"
ns.localization.notificationsanimations = "显示动画"
ns.localization.notificationsanimationsTooltip = "动画显示/隐藏通知条"
ns.localization.notificationstimeShown = "持续时间"
ns.localization.notificationscheckEvents = "日历事件"
ns.localization.notificationscheckEventsTooltip = "当你有待定的日历事件时显示通知"
ns.localization.notificationscheckGuildEvents = "公会事件"
ns.localization.notificationscheckGuildEventsTooltip = "当你有待定的公会事件时显示通知.这类行事历不在默认日历上显示，很容易被忽视"
ns.localization.notificationscheckMail = "邮件"
ns.localization.notificationscheckMailTooltip = "当有新邮件时显示通知"
ns.localization.notificationscheckBagsFull = "背包满"
ns.localization.notificationscheckBagsFullTooltip = "当背包慢时显示通知"

ns.localization.unitframes = "头像框体"
ns.localization.unitframesSubText = "These options control most of the options for the unit frames. If you want to move the unit frames easily, install oUF_MovableFrames."
ns.localization.unitframesenable = "启用"
ns.localization.unitframesenableTooltip = "如果你想使用其他头像插件则禁用这个选项"
ns.localization.unitframesshadow = "阴影边框"
ns.localization.unitframesshadowTooltip = "给头像框体四周添加一圈阴影。"
ns.localization.unitframesenableGroup = "小队/团队框体"
ns.localization.unitframesenableGroupTooltip = "如果你想使用其他团队框架类插件则禁用这个选项"
ns.localization.unitframeslimitRaidSize = "Limit raid size"
ns.localization.unitframeslimitRaidSizeTooltip = "启用后团队框架最多只显示6个队伍30人。"
ns.localization.unitframesshowRaidFrames = "显示团队框架"
ns.localization.unitframesshowRaidFramesTooltip = "如果禁用此项，即使你在团队中也只显示小队框架。"
ns.localization.unitframespartyNameAlways = "显示团员名字"
ns.localization.unitframespartyNameAlwaysTooltip = "在团队框架上显示团员名字"
ns.localization.unitframesabsorb = "吸收量"
ns.localization.unitframesabsorbTooltip = "在框体上显示吸收量"
ns.localization.unitframeshealerClasscolours = "总是使用职业染色"
ns.localization.unitframeshealerClasscoloursTooltip = "启用职业染色来代替透明渐变"
ns.localization.unitframespvp = "PVP 图标"
ns.localization.unitframespvpTooltip = "在玩家框体显示一个红色的PVP图标"
ns.localization.unitframescastbar = "施法条"
ns.localization.unitframescastbarTooltip = "如果想使用其他施法条插件请先禁用此项。"
ns.localization.unitframesstatusIndicator = "状态指示"
ns.localization.unitframesstatusIndicatorTooltip = "在玩家框体显示休息或战斗状态"
ns.localization.unitframesstatusIndicatorCombat = "战斗状态"
ns.localization.unitframesstatusIndicatorCombatTooltip = "在玩家框体显示战斗状态。如果禁用，则只显示休息状态"

ns.localization.unitframesenableArena = "竞技场/扛旗者框体"
ns.localization.unitframesenableArenaTooltip = "打开竞技场敌对目标和战场扛旗者的框体。"

ns.localization.tooltip = "鼠标提示"
ns.localization.tooltipSubText = "调整鼠标提示的外观和功能。"
ns.localization.tooltipenable = "启用"
ns.localization.tooltipenableTooltip = "禁用这个选项如果你想使用其他鼠标提示类插件。"
ns.localization.tooltipcursor = "跟随鼠标"
ns.localization.tooltiptitle = "隐藏头衔"
ns.localization.tooltiprealm = "隐藏服务器"
ns.localization.tooltiprank = "隐藏公会等级"
ns.localization.tooltippvp = "隐藏 PVP 状态"
ns.localization.tooltipfaction = "隐藏阵营"
ns.localization.tooltiphide = "战斗中隐藏 world objects"
ns.localization.tooltiphideall = "战斗中隐藏一切"
ns.localization.tooltipid = "显示 aura id"
ns.localization.tooltipcaster = "显示谁施放的 aura"
ns.localization.tooltipilvl = "显示装等"
ns.localization.tooltipspec = "显示专精"

ns.localization.classmod = "职业特定"
ns.localization.classmodSubText = "设置加载职业特定的组件"

local classes = UnitSex("player") == 2 and LOCALIZED_CLASS_NAMES_MALE or LOCALIZED_CLASS_NAMES_FEMALE

for class, localized in pairs(classes) do
	ns.localization["classmod"..strlower(class)] = localized
end

ns.localization.classmoddeathknight = ns.localization.classmoddeathknight..":|cffffffff 死骑符文条"
ns.localization.classmoddruidMana = ns.localization.classmoddruid..":|cffffffff 德鲁伊变形法力条"
ns.localization.classmoddruidEclipse = ns.localization.classmoddruid..":|cffffffff 鸟德月蚀条"
ns.localization.classmodmage = ns.localization.classmodmage..":|cffffffff 法师资源监视"
ns.localization.classmodmonk = ns.localization.classmodmonk..":|cffffffff 武僧真气条"
ns.localization.classmodpaladinHP = ns.localization.classmodpaladin..":|cffffffff 圣骑豆子监视"
ns.localization.classmodpaladinRF = ns.localization.classmodpaladin..":|cffffffff 防骑正义之怒提示"
ns.localization.classmodpriest = ns.localization.classmodpriest..":|cffffffff 牧师宝珠条"
ns.localization.classmodwarlock = ns.localization.classmodwarlock..":|cffffffff 术士资源条"

ns.localization.credits = "Credits"
ns.localization.thankYou = "Thank you:"
ns.localization.alza = "For AlzaUI, which once formed the basis for FreeUI"
ns.localization.haste = "For the oUF framework, the foundation of the unit frames in this UI"
ns.localization.tukz = "For allowing the use of his code, and collaboration in UI development"
ns.localization.zork = "For rActionBarStyler, rActionButtonStyler, and rBuffFrameStyler"
ns.localization.others = "as well as..."
