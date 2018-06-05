require "lib/utilities/prototyping"


local function moveRecipeUnlock(oldTechnologyName, newTechnologyName, recipeName)
  removeRecipeUnlock(oldTechnologyName, recipeName)
  addRecipeUnlock(newTechnologyName, recipeName)
end

local function moveRecipeUnlocks(oldTechnologyName, newTechnologyName, recipeNames)
  for _,recipeName in pairs(recipeNames) do
    moveRecipeUnlock(oldTechnologyName, newTechnologyName, recipeName)
  end
end



-- ingredients for science-pack-2 needs to move to basic-science-research-1
moveRecipeUnlocks("automation-2", "basic-science-research-1", {
  "sct-t2-instruments",
  "sct-t2-microcircuits",
  "sct-t2-micro-wafer",
  "sct-t2-wafer-stamp",
  "sct-t2-reaction-nodes",
})



-- ingredients for science-pack-3 needs to move to basic-science-research-2
moveRecipeUnlocks("advanced-electronics", "basic-science-research-2", {
  "sct-t3-flash-fuel",
  "sct-t3-laser-foci",
  "sct-t3-laser-emitter",
  "sct-t3-femto-lasers",
  "sct-t3-atomic-sensors",
  "sct-waste-processing-copper",
})



-- ingredients for military-science-pack needs to move to basic-military-science-research
moveRecipeUnlocks("military-2", "basic-military-science-research", {
  "sct-mil-subplating",
  "sct-mil-plating",
  "sct-mil-circuit1",
  "sct-mil-circuit2",
  "sct-mil-circuit3",
  "sct-waste-processing-copper",
  "sct-waste-processing-mixed",
})



-- ingredients for production-science-pack need to move to advanced-science-research-1
moveRecipeUnlocks("advanced-material-processing-2", "advanced-science-research-1", {
  "sct-prod-biosilicate",
  "sct-prod-baked-biopaste",
  "sct-prod-bioprocessor",
  "sct-prod-overclocker",
  "sct-waste-processing-mixed",
})



-- ingredients for high-tech-science-pack need to move to advanced-science-research-2
moveRecipeUnlocks("advanced-electronics-2", "advanced-science-research-2", {
  "sct-htech-thermalstore",
  "sct-htech-thermalstore-heated",
  "sct-htech-capbank",
  "sct-htech-random",
  "sct-htech-injector",
  "sct-waste-processing-mixed",
})
