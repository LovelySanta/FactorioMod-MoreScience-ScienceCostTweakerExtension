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



-- lab
addRecipeUnlock("basic-automation", "sct-lab1-construction")
addRecipeUnlock("basic-automation", "sct-lab1-mechanization")



-- sct-lab-2
moveRecipeUnlocks("automation-2", "basic-science-research-1", {
  "sct-lab2-construction",
  "sct-lab2-automatization",
  "sct-lab-2",
})



-- sct-lab-3
moveRecipeUnlocks("advanced-electronics", "basic-science-research-2", {
  "sct-lab3-construction",
  "sct-lab3-optics",
  "sct-lab-3",
})



-- sct-lab-4
moveRecipeUnlocks("advanced-electronics-2", "advanced-science-research-2", {
  "sct-lab4-construction",
  "sct-lab4-manipulators",
  "sct-lab-4",
})
