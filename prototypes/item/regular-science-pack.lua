
-- move regular science packs back to the science subgroup where they belong
local function moveSciencePackBack(sciencePackName)
  local infusedSciencePack = {
    ["science-pack-1"] = "infused-basic-science-pack-1",
    ["science-pack-2"] = "infused-basic-science-pack-2",
    ["science-pack-3"] = "infused-basic-science-pack-3",
    ["production-science-pack"] = "infused-advanced-science-pack-1",
    ["high-tech-science-pack"] = "infused-advanced-science-pack-2",
    ["space-science-pack"] = "infinite-science-pack",
    ["military-science-pack"] = "infused-basic-military-science-pack",
    ["basic-automation-science-pack"] = "infused-basic-automation-science-pack",
    ["basic-logistics-science-pack"] = "infused-basic-logistics-science-pack",
    ["basic-power-science-pack"] = "infused-basic-power-science-pack",
  }

  if data.raw["tool"][sciencePackName] then
    data.raw["tool"][sciencePackName].subgroup = "science-pack"
    data.raw["tool"][sciencePackName].order = "z-MoreScience-" .. stringSplit(stringSplit(data.raw["tool"][infusedSciencePack[sciencePackName]].order, "-")[3], "[")[1] .. "[" .. sciencePackName .. "]"
    log(data.raw["tool"][sciencePackName].order)
  else
    log("WARNING: could not move " .. sciencePackName)
  end
end

moveSciencePackBack("science-pack-1")
moveSciencePackBack("science-pack-2")
moveSciencePackBack("science-pack-3")
moveSciencePackBack("military-science-pack")
moveSciencePackBack("production-science-pack")
moveSciencePackBack("high-tech-science-pack")

moveSciencePackBack("basic-automation-science-pack")
moveSciencePackBack("basic-power-science-pack")
moveSciencePackBack("basic-logistics-science-pack")
