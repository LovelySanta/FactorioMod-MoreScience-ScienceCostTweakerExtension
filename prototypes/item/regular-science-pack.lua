
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

-- redo the icons since SCT changed them
for potionName, potionNumber in pairs({
  ["science-pack-1"] = "14",
  ["science-pack-2"] = "03",
  ["science-pack-3"] = "08",
  ["production-science-pack"] = "10",
  ["high-tech-science-pack"] = "02",
  ["space-science-pack"] = "01",
  ["military-science-pack"] = "09",
}) do
  data.raw["tool"][potionName].icon = nil
  data.raw["tool"][potionName].icon_size = nil
  data.raw["tool"][potionName].icons =
  {
    {
      icon = "__MoreScience__/graphics/icons/potion/set-01/potion-" .. potionNumber .. ".png",
      icon_size = 32,
    },
    {
      icon = "__MoreScience__/graphics/icons/potion/cork.png",
      icon_size = 32,
    },
  }
end
