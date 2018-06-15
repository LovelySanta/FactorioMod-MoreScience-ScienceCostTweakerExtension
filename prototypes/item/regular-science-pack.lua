
-- move regular science packs back to the science subgroup where they belong
local function moveSciencePackBack(sciencePackName)
  local infusedSciencePack = {
    ["science-pack-1"] = "infused-basic-science-pack-1",
    ["science-pack-2"] = "infused-basic-science-pack-2",
    ["science-pack-3"] = "infused-basic-science-pack-3",
    ["production-science-pack"] = "infused-advanced-science-pack-1",
    ["high-tech-science-pack"] = "infused-advanced-science-pack-2",
    ["space-science-pack"] = "infused-extreme-science-pack",
    ["military-science-pack"] = "infused-basic-military-science-pack",
    ["basic-automation-science-pack"] = "infused-basic-automation-science-pack",
    ["basic-logistics-science-pack"] = "infused-basic-logistics-science-pack",
    ["basic-power-science-pack"] = "infused-basic-power-science-pack",
  }

  if data.raw["tool"][sciencePackName] then
    data.raw["tool"][sciencePackName].subgroup = "science-pack"
    data.raw["tool"][sciencePackName].order = "z-MoreScience-" .. MoreScience.lib.util.stringSplit(MoreScience.lib.util.stringSplit(data.raw["tool"][infusedSciencePack[sciencePackName]].order, "-")[3], "[")[1] .. "[" .. sciencePackName .. "]"
  else
    log("WARNING: could not move " .. sciencePackName)
  end

  if data.raw["recipe"][sciencePackName] then
    data.raw["recipe"][sciencePackName].subgroup = nil
    data.raw["recipe"][sciencePackName].order = nil
  end
end

moveSciencePackBack("science-pack-1")
moveSciencePackBack("science-pack-2")
moveSciencePackBack("science-pack-3")
moveSciencePackBack("military-science-pack")
moveSciencePackBack("production-science-pack")
moveSciencePackBack("high-tech-science-pack")
moveSciencePackBack("space-science-pack")
moveSciencePackBack("basic-automation-science-pack")
moveSciencePackBack("basic-power-science-pack")
moveSciencePackBack("basic-logistics-science-pack")

-- add new icons
data.raw["tool"]["basic-automation-science-pack"].icon = "__MoreScience-ScienceCostTweakerExtension__/graphics/orange_potion.png"
data.raw["tool"]["basic-automation-science-pack"].icon_size = 128

data.raw["tool"]["basic-power-science-pack"].icon = util.table.deepcopy(data.raw["tool"]["science-pack-3"].icons[1].icon)
data.raw["tool"]["basic-power-science-pack"].icon_size = util.table.deepcopy(data.raw["tool"]["science-pack-3"].icons[1].icon_size)
data.raw["tool"]["science-pack-3"].icon = "__MoreScience-ScienceCostTweakerExtension__/graphics/blue_potion.png"
data.raw["tool"]["science-pack-3"].icons = nil
data.raw["tool"]["science-pack-3"].icon_size = 128

data.raw["tool"]["basic-logistics-science-pack"].icon = "__MoreScience-ScienceCostTweakerExtension__/graphics/pink_bright_potion.png"
data.raw["tool"]["basic-logistics-science-pack"].icon_size = 128
