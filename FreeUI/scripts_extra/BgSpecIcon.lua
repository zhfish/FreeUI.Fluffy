-- BgSpecIcon v1.02b by d07.RiV (Iroared)
-- "hotfix" by RandomHero13
-- All rights reserved
local _G = _G

BgSpecIcon = CreateFrame ("Frame", nil, UIParent)
local BGS = BgSpecIcon
BGS:Hide ()

---------------------------------------------------------------------------

local L = {}
local gameLocale = GetLocale()
if gameLocale == "enGB" then
  gameLocale = "enUS"
end

-- Following borrowed from LibBabble-TalentTree
if gameLocale == "frFR" then
  L["Affliction"] = "Affliction"
  L["Arcane"] = "Arcane"
  L["Arms"] = "Armes"
  L["Assassination"] = "Assassinat"
  L["Balance"] = "Equilibre"
  L["Beast Mastery"] = "Maîtrise des bêtes"
  L["Blood"] = "Sang"
  L["Combat"] = "Combat"
  L["Demonology"] = "Démonologie"
  L["Destruction"] = "Destruction"
  L["Discipline"] = "Discipline"
  L["Elemental"] = "Elémentaire"
  L["Enhancement"] = "Amélioration"
  L["Feral Combat"] = "Combat farouche"
  L["Fire"] = "Feu"
  L["Frost"] = "Givre"
  L["Fury"] = "Fureur"
  L["Holy"] = "Sacré"
  L["Marksmanship"] = "Précision"
  L["Protection"] = "Protection"
  L["Restoration"] = "Restauration"
  L["Retribution"] = "Vindicte"
  L["Shadow"] = "Ombre"
  L["Subtlety"] = "Finesse"
  L["Survival"] = "Survie"
  L["Unholy"] = "Impie"
elseif gameLocale == "deDE" then
  L["Affliction"] = "Gebrechen"
  L["Arcane"] = "Arkan"
  L["Arms"] = "Waffen"
  L["Assassination"] = "Meucheln"
  L["Balance"] = "Gleichgewicht"
  L["Beast Mastery"] = "Tierherrschaft"
  L["Blood"] = "Blut"
  L["Combat"] = "Kampf"
  L["Demonology"] = "Dämonologie"
  L["Destruction"] = "Zerstörung"
  L["Discipline"] = "Disziplin"
  L["Elemental"] = "Elementar"
  L["Enhancement"] = "Verstärkung"
  L["Feral Combat"] = "Wilder Kampf"
  L["Fire"] = "Feuer"
  L["Frost"] = "Frost"
  L["Fury"] = "Furor"
  L["Holy"] = "Heilig"
  L["Marksmanship"] = "Treffsicherheit"
  L["Protection"] = "Schutz"
  L["Restoration"] = "Wiederherstellung"
  L["Retribution"] = "Vergeltung"
  L["Shadow"] = "Schatten"
  L["Subtlety"] = "Täuschung"
  L["Survival"] = "Überleben"
  L["Unholy"] = "Unheilig"
elseif gameLocale == "koKR" then
  L["Affliction"] = "고통"
  L["Arcane"] = "비전"
  L["Arms"] = "무기"
  L["Assassination"] = "암살"
  L["Balance"] = "조화"
  L["Beast Mastery"] = "야수"
  L["Blood"] = "혈기"
  L["Combat"] = "전투"
  L["Demonology"] = "악마"
  L["Destruction"] = "파괴"
  L["Discipline"] = "수양"
  L["Elemental"] = "정기"
  L["Enhancement"] = "고양"
  L["Feral Combat"] = "야성"
  L["Fire"] = "화염"
  L["Frost"] = "냉기"
  L["Fury"] = "분노"
  L["Holy"] = "신성"
  L["Marksmanship"] = "사격"
  L["Protection"] = "방어"
  L["Restoration"] = "복원"
  L["Retribution"] = "징벌"
  L["Shadow"] = "암흑"
  L["Subtlety"] = "잠행"
  L["Survival"] = "생존"
  L["Unholy"] = "부정"
elseif gameLocale == "esMX" then
  L["Affliction"] = "Aflicción"
  L["Arcane"] = "Arcano"
  L["Arms"] = "Armas"
  L["Assassination"] = "Asesinato"
  L["Balance"] = "Balance"
  L["Beast Mastery"] = "Bestias"
  L["Blood"] = "Sangre"
  L["Combat"] = "Combate"
  L["Demonology"] = "Demonología"
  L["Destruction"] = "Destrucción"
  L["Discipline"] = "Disciplina"
  L["Elemental"] = "Elemental"
  L["Enhancement"] = "Mejora"
  L["Feral Combat"] = "Combate feral"
  L["Fire"] = "Fuego"
  L["Frost"] = "Escarcha"
  L["Fury"] = "Furia"
  L["Holy"] = "Sagrado"
  L["Marksmanship"] = "Puntería"
  L["Protection"] = "Protección"
  L["Restoration"] = "Restauración"
  L["Retribution"] = "Reprensión"
  L["Shadow"] = "Sombra"
  L["Subtlety"] = "Sutileza"
  L["Survival"] = "Supervivencia"
  L["Unholy"] = "Profano"
elseif gameLocale == "ruRU" then
  L["Affliction"] = "Колдовство"
  L["Arcane"] = "Тайная магия"
  L["Arms"] = "Оружие"
  L["Assassination"] = "Ликвидация"
  L["Balance"] = "Баланс"
  L["Beast Mastery"] = "Повелитель зверей"
  L["Blood"] = "Кровь"
  L["Combat"] = "Бой"
  L["Demonology"] = "Демонология"
  L["Destruction"] = "Разрушение"
  L["Discipline"] = "Послушание"
  L["Elemental"] = "Стихии"
  L["Enhancement"] = "Совершенствование"
  L["Feral Combat"] = "Сила зверя"
  L["Fire"] = "Огонь"
  L["Frost"] = "Лед"
  L["Fury"] = "Неистовство"
  L["Holy"] = "Свет"
  L["Marksmanship"] = "Стрельба"
  L["Protection"] = "Защита"
  L["Restoration"] = "Исцеление"
  L["Retribution"] = "Воздаяние"
  L["Shadow"] = "Тьма"
  L["Subtlety"] = "Скрытность"
  L["Survival"] = "Выживание"
  L["Unholy"] = "Нечестивость"
elseif gameLocale == "zhCN" then
  L["Affliction"] = "痛苦"
  L["Arcane"] = "奥术"
  L["Arms"] = "武器"
  L["Assassination"] = "刺杀"
  L["Balance"] = "平衡"
  L["Beast Mastery"] = "野兽控制"
  L["Blood"] = "鲜血"
  L["Combat"] = "战斗"
  L["Demonology"] = "恶魔学识"
  L["Destruction"] = "毁灭"
  L["Discipline"] = "戒律"
  L["Elemental"] = "元素战斗"
  L["Enhancement"] = "增强"
  L["Feral Combat"] = "野性战斗"
  L["Fire"] = "火焰"
  L["Frost"] = "冰霜"
  L["Fury"] = "狂怒"
  L["Holy"] = "神圣"
  L["Marksmanship"] = "射击"
  L["Protection"] = "防护"
  L["Restoration"] = "恢复"
  L["Retribution"] = "惩戒"
  L["Shadow"] = "暗影魔法"
  L["Subtlety"] = "敏锐"
  L["Survival"] = "生存技能"
  L["Unholy"] = "邪恶"
elseif gameLocale == "esES" then
  L["Affliction"] = "Aflicción"
  L["Arcane"] = "Arcano"
  L["Arms"] = "Armas"
  L["Assassination"] = "Asesinato"
  L["Balance"] = "Equilibrio"
  L["Beast Mastery"] = "Dominio de bestias"
  L["Blood"] = "Sangre"
  L["Combat"] = "Combate"
  L["Demonology"] = "Demonología"
  L["Destruction"] = "Destrucción"
  L["Discipline"] = "Disciplina"
  L["Elemental"] = "Elemental"
  L["Enhancement"] = "Mejora"
  L["Feral Combat"] = "Combate Feral"
  L["Fire"] = "Fuego"
  L["Frost"] = "Escarcha"
  L["Fury"] = "Furia"
  L["Holy"] = "Sagrado"
  L["Marksmanship"] = "Puntería"
  L["Protection"] = "Protección"
  L["Restoration"] = "Restauración"
  L["Retribution"] = "Reprensión"
  L["Shadow"] = "Sombras"
  L["Subtlety"] = "Sutileza"
  L["Survival"] = "Supervivencia"
  L["Unholy"] = "Profano"
elseif gameLocale == "zhTW" then
  L["Affliction"] = "痛苦"
  L["Arcane"] = "秘法"
  L["Arms"] = "武器"
  L["Assassination"] = "刺殺"
  L["Balance"] = "平衡"
  L["Beast Mastery"] = "野獸控制"
  L["Blood"] = "血魄"
  L["Combat"] = "戰鬥"
  L["Demonology"] = "惡魔學識"
  L["Destruction"] = "毀滅"
  L["Discipline"] = "戒律"
  L["Elemental"] = "元素"
  L["Enhancement"] = "增強"
  L["Feral Combat"] = "野性戰鬥"
  L["Fire"] = "火焰"
  L["Frost"] = "冰霜"
  L["Fury"] = "狂怒"
  L["Holy"] = "神聖"
  L["Marksmanship"] = "射擊"
  L["Protection"] = "防護"
  L["Restoration"] = "恢復"
  L["Retribution"] = "懲戒"
  L["Shadow"] = "暗影"
  L["Subtlety"] = "敏銳"
  L["Survival"] = "生存"
  L["Unholy"] = "穢邪"
end

local SpecIcons = {
  ["PRIEST"] = {
    ["Discipline"] = "Interface\\Icons\\Spell_Holy_PowerWordShield",
    ["Holy"] = "Interface\\Icons\\Spell_Holy_GuardianSpirit",
    ["Shadow"] = "Interface\\Icons\\Spell_Shadow_ShadowWordPain",
  },
  ["MAGE"] = {
    ["Arcane"] = "Interface\\Icons\\Spell_Holy_MagicalSentry",
    ["Fire"] = "Interface\\Icons\\Spell_Fire_FireBolt02",
    ["Frost"] = "Interface\\Icons\\Spell_Frost_FrostBolt02",
  },
  ["WARLOCK"] = {
    ["Affliction"] = "Interface\\Icons\\Spell_Shadow_DeathCoil",
    ["Demonology"] = "Interface\\Icons\\Spell_Shadow_Metamorphosis",
    ["Destruction"] = "Interface\\Icons\\Spell_Shadow_RainOfFire",
  },
  ["ROGUE"] = {
    ["Assassination"] = "Interface\\Icons\\Ability_Rogue_Eviscerate",
    ["Combat"] = "Interface\\Icons\\Ability_BackStab",
    ["Subtlety"] = "Interface\\Icons\\Ability_Stealth",
  },
  ["DRUID"] = {
    ["Balance"] = "Interface\\Icons\\Spell_Nature_StarFall",
    ["Restoration"] = "Interface\\Icons\\Spell_Nature_HealingTouch",
	["Feral"] = "Interface\\Icons\\Ability_Druid_CatForm",
	["Guardian"] = "Interface\\Icons\\Ability_Racial_BearForm",
  },
  ["HUNTER"] = {
    ["Beast Mastery"] = "Interface\\Icons\\Ability_Druid_FerociousBite",
    ["Marksmanship"] = "Interface\\Icons\\Ability_Marksmanship",
    ["Survival"] = "Interface\\Icons\\INV_Misc_Net_01",
  },
  ["SHAMAN"] = {
    ["Elemental"] = "Interface\\Icons\\Spell_Nature_Lightning",
    ["Enhancement"] = "Interface\\Icons\\Spell_Nature_LightningShield",
    ["Restoration"] = "Interface\\Icons\\Spell_Nature_MagicImmunity",
  },
  ["WARRIOR"] = {
    ["Arms"] = "Interface\\Icons\\Ability_Warrior_SavageBlow",
    ["Fury"] = "Interface\\Icons\\Ability_Warrior_InnerRage",
    ["Protection"] = "Interface\\Icons\\Ability_Warrior_DefensiveStance",
  },
  ["PALADIN"] = {
    ["Holy"] = "Interface\\Icons\\Spell_Holy_HolyBolt",
    ["Protection"] = "Interface\\Icons\\Ability_Paladin_ShieldoftheTemplar",
    ["Retribution"] = "Interface\\Icons\\Spell_Holy_AuraOfLight",
  },
  ["DEATHKNIGHT"] = {
    ["Blood"] = "Interface\\Icons\\Spell_Deathknight_BloodPresence",
    ["Frost"] = "Interface\\Icons\\Spell_Deathknight_FrostPresence",
    ["Unholy"] = "Interface\\Icons\\Spell_Deathknight_UnholyPresence",
  },
  ["MONK"] = {
    ["Brewmaster"] = "Interface\\Icons\\inv_drink_05",
    ["Mistweaver"] = "Interface\\Icons\\Ability_Monk_Summonserpentstatue",
    ["Windwalker"] = "Interface\\Icons\\pandarenracial_bouncy",
  },
}
function GetSpecIcon (class, spec)
  local enspec = spec
  for k, v in pairs (L) do
    if v == spec then
      enspec = k
    end
  end
  if SpecIcons[class] then
    return SpecIcons[class][enspec]
  end
  return nil
end

---------------------------------------------------------------------------

function BGS.OnUpdate ()
  local scrollOffset = FauxScrollFrame_GetOffset (WorldStateScoreScrollFrame)
  local numScores = GetNumBattlefieldScores ()
  for i = 1, MAX_WORLDSTATE_SCORE_BUTTONS do
    local index = scrollOffset + i
    if index <= numScores then
      local scoreButton = _G["WorldStateScoreButton" .. i]
      local name, _, _, _, _, _, _, _, classToken, _, _, _, _, _, _, talentSpec = GetBattlefieldScore (index)
      scoreButton.name.text:SetText ("x   " .. name)
      if scoreButton.spec == nil then
        scoreButton.spec = scoreButton.name:CreateTexture (nil, "ARTWORK")
        scoreButton.spec:SetPoint ("LEFT", scoreButton.name.text, 0, 0)
        scoreButton.spec:SetWidth (14)
        scoreButton.spec:SetHeight (14)
      end
      local icon = GetSpecIcon (classToken, talentSpec)
      if icon then
        scoreButton.spec:SetTexture (icon)
        scoreButton.spec:Show ()
      else
        scoreButton.spec:Hide ()
      end
    end
  end
end
function BGS:SetUpHooks ()
  hooksecurefunc ("WorldStateScoreFrame_Update", self.OnUpdate)
end

--------------------------------------------------------------------------

function BGS:OnEvent (event, ...)
  if self[event] then
    self[event] (self, ...)
  end
end
function BGS:ADDON_LOADED (addon)
  if addon == "FreeUI" then
    self:SetUpHooks ()
  end
end

BGS:SetScript ("OnEvent", BGS.OnEvent)
BGS:RegisterEvent ("ADDON_LOADED")