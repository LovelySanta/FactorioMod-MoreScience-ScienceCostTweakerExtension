local scienceNames = require("prototypes/settings").scienceNames
local complexScienceExpertiseName = data.raw.technology["sct-science-pack-gold"] and "sct-science-pack-gold" or "science-pack-gold"
local outworldBiologyTestingName  = data.raw.technology["sct-alien-science-pack"] and "sct-alien-science-pack" or "alien-science-pack"

if data.raw["tool"]["science-pack-gold"] or data.raw["tool"]["alien-science-pack"] or data.raw["technology"]["sct-science-pack-gold"] then
  -- Complex Science Expertise
  LSlib.technology.addIngredient(complexScienceExpertiseName, 1, string.format(scienceNames.orange, "pack"))
  --LSlib.technology.addIngredient(complexScienceExpertiseName, 1, string.format(scienceNames.gray, "pack"))
  LSlib.technology.changeIcons(complexScienceExpertiseName, LSlib.technology.getIcons(outworldBiologyTestingName))

  -- Outworld Biology Testing
  LSlib.technology.moveRecipeUnlock("alien-research", outworldBiologyTestingName, "alien-empty-bottle")
  LSlib.technology.changeIcons(outworldBiologyTestingName, LSlib.technology.getIcons("alien-research"))

  -- alien research
  LSlib.technology.removeRecipeUnlock("alien-research", "alien-science-pack")
  LSlib.technology.removeIngredient("alien-research", string.format(scienceNames.gray, "pack"))
  LSlib.technology.removeIngredient("alien-research", string.format(scienceNames.blue, "pack"))

  -- alien lab
  LSlib.technology.addIngredient("sct-lab-alien", 1, string.format(scienceNames.orange, "pack"))

  --[[
  MoreScience.lib.technology.addPrerequisite("sct-research-gold", "advanced-research")
  MoreScience.lib.technology.addPrerequisite("sct-research-gold", "military-3")
  MoreScience.lib.technology.addPrerequisite("sct-lab-alien", "military-3")

  for _,ingredientName in pairs({
    "science-pack-1",
    "science-pack-2",
    "military-science-pack",
    "science-pack-3",
  }) do
    MoreScience.lib.technology.addIngredient("sct-research-alien", 1, ingredientName)
  end
  ]]

end
