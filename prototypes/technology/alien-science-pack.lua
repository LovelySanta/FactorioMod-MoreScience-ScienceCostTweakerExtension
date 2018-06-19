
if data.raw["item"]["science-pack-gold"] or data.raw["item"]["alien-science-pack"] or data.raw["technology"]["sct-research-gold"] then
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
end
