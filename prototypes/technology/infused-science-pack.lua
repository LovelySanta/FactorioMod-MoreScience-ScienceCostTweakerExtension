require 'util'

if data.raw["technology"]["infinite-science-research"] then
  local regularScienceResearch = {
    ["science-pack-1"] = "sct-research-t1",
    ["science-pack-2"] = "basic-science-research-1",
    ["science-pack-3"] = "basic-science-research-2",
    ["production-science-pack"] = "advanced-science-research-1",
    ["high-tech-science-pack"] = "advanced-science-research-2",
    ["space-science-pack"] = "infused-science-research",
    ["military-science-pack"] = "basic-military-science-research",
    ["basic-automation-science-pack"] = "basic-automation-science-research",
    ["basic-logistics-science-pack"] = "basic-logistics-science-research",
    ["basic-power-science-pack"] = "basic-power-science-research",
  }
  local infusedScienceResearch = {
    ["science-pack-1"] = "infused-basic-science-research-1",
    ["science-pack-2"] = "infused-basic-science-research-2",
    ["science-pack-3"] = "infused-basic-science-research-3",
    ["production-science-pack"] = "infused-advanced-science-research-1",
    ["high-tech-science-pack"] = "infused-advanced-science-research-2",
    ["space-science-pack"] = "infinite-science-research",
    ["military-science-pack"] = "infused-basic-military-science-research",
    ["basic-automation-science-pack"] = "infused-basic-automation-science-research",
    ["basic-logistics-science-pack"] = "infused-basic-logistics-science-research",
    ["basic-power-science-pack"] = "infused-basic-power-science-research",
  }

  for _,sciencePackName in pairs({
    "science-pack-1",
    "science-pack-2",
    "science-pack-3",
    "production-science-pack",
    "high-tech-science-pack",
    --"space-science-pack",
    "military-science-pack",
    "basic-automation-science-pack",
    "basic-logistics-science-pack",
    "basic-power-science-pack",
  }) do
    log(regularScienceResearch[sciencePackName])
    if data.raw["technology"][infusedScienceResearch[sciencePackName]] and data.raw["technology"][regularScienceResearch[sciencePackName]] then
      data.raw["technology"][infusedScienceResearch[sciencePackName]].icon = nil
      data.raw["technology"][infusedScienceResearch[sciencePackName]].icon_size = nil

      data.raw["technology"][infusedScienceResearch[sciencePackName]].icons =
      {
        {
          icon = util.table.deepcopy(data.raw["technology"]["infinite-science-research"].icon),
          icon_size = util.table.deepcopy(data.raw["technology"]["infinite-science-research"].icon_size),
        },
        {
          icon = data.raw["technology"][regularScienceResearch[sciencePackName]].icon,
          icon_size = data.raw["technology"][regularScienceResearch[sciencePackName]].icon_size,
          scale = .45,
          --shift = {0, .2 * data.raw["technology"][regularScienceResearch[sciencePackName]].icon_size},
        }
      }
    end

  end
end
