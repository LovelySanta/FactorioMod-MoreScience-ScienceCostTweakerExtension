require 'util'
local scienceTech  = require("prototypes/settings").techIcons
local scienceNames = require("prototypes/settings").scienceNames
local rocketParts  = require("prototypes/settings").rocketParts

-- red science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
local redSciencePackTech = "sct-automation-science-pack"

LSlib.technology.moveRecipeUnlock("bottling-research", "bottling-research", string.format(scienceNames.red, "fluid"))

LSlib.technology.removeRecipeUnlock(redSciencePackTech , "automation-science-pack"                       )
LSlib.technology.addRecipeUnlock   (redSciencePackTech, string.format(scienceNames.red, "pack").."-basic")
for _,recipeEffect in pairs{
  "sct-t1-ironcore", "sct-t1-magnet-coils",
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(redSciencePackTech, redSciencePackTech, recipeEffect)
end
for _,recipeEffect in pairs{
  "empty-bottle", "cork", "glass",
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock("bottling-research", "bottling-research", recipeEffect)
end

if mods["bobtech"] and settings.startup["bobmods-burnerphase"].value == true then
  -- there are now two redSciencePackTech to unlock the burner phase
  LSlib.technology.setHidden(redSciencePackTech)
  local bobRedTechName = "automation-science-pack"

  -- move prerequisites of redSciencePackTech over to bobs redSciencePackTech
  for _,prerequisiteName in pairs(data.raw.technology[redSciencePackTech].prerequisites or {}) do
    LSlib.technology.addPrerequisite(bobRedTechName, prerequisiteName)
  end

  -- move prerequisites on red tech over to bobs redSciencePackTech
  for technologyName, technology in pairs(data.raw.technology) do
    for prerequisiteIndex, prerequisiteName in pairs(technology.prerequisites or {}) do
      if prerequisiteName == redSciencePackTech then
        LSlib.technology.movePrerequisite(technologyName, prerequisiteName, bobRedTechName)
      end
    end
  end

  -- move the recipe unlocks over to redSciencePackTech
  local effects = util.table.deepcopy(data.raw.technology[redSciencePackTech].effects) or {}
  for _,effect in pairs(effects) do
    if effect.type == "unlock-recipe" then
      LSlib.technology.moveRecipeUnlock(redSciencePackTech, bobRedTechName, effect.recipe)
    end
  end
end



-- green science pack ----------------------------------------------------------
--------------------------------------------------------------------------------
local greenSciencePackTech = string.format(scienceNames.green, "pack")
LSlib.technology.changeIcon(greenSciencePackTech, scienceTech.icon .. "potion-green.png", scienceTech.icon_size)

LSlib.technology.addRecipeUnlock (greenSciencePackTech, string.format(scienceNames.green, "fluid"))
for _,recipeEffect in pairs{
  "sct-t2-instruments", "sct-t2-microcircuits", "sct-t2-micro-wafer", "sct-t2-wafer-stamp",
  "sct-t2-reaction-nodes",
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(greenSciencePackTech, greenSciencePackTech, recipeEffect)
end



-- gray science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
local graySciencePackTech = string.format(scienceNames.gray, "pack")
LSlib.technology.changeIcon(graySciencePackTech, scienceTech.icon .. "potion-gray.png", scienceTech.icon_size)

LSlib.technology.addRecipeUnlock(graySciencePackTech, string.format(scienceNames.gray, "fluid"))
for _,recipeEffect in pairs{
  "sct-mil-subplating", "sct-mil-plating",
  "sct-mil-circuit1", "sct-mil-circuit2", "sct-mil-circuit3",
  "sct-waste-processing-copper", "sct-waste-processing-mixed"
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(graySciencePackTech, graySciencePackTech, recipeEffect)
end



-- orange science pack ---------------------------------------------------------
--------------------------------------------------------------------------------
local orangeSciencePackTech = string.format(scienceNames.orange, "pack")

for _,recipeEffect in pairs{
  string.format(scienceNames.orange, "fluid")
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(orangeSciencePackTech, orangeSciencePackTech, recipeEffect)
end



-- cyan science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
local cyanSciencePackTech = string.format(scienceNames.cyan, "pack")

for _,recipeEffect in pairs{
  string.format(scienceNames.cyan, "fluid")
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(cyanSciencePackTech, cyanSciencePackTech, recipeEffect)
end



-- blue science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
local blueSciencePackTech = string.format(scienceNames.blue, "pack")
LSlib.technology.changeIcon(blueSciencePackTech, scienceTech.icon .. "potion-blue.png", scienceTech.icon_size)

LSlib.technology.removeIngredient(blueSciencePackTech,    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (blueSciencePackTech, 3, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (blueSciencePackTech, 5, string.format(scienceNames.orange, "pack"))

LSlib.technology.addRecipeUnlock(blueSciencePackTech, string.format(scienceNames.blue, "fluid"))
for _,recipeEffect in pairs{
  "sct-t3-atomic-sensors",
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(blueSciencePackTech, blueSciencePackTech, recipeEffect)
end



-- purple science pack ---------------------------------------------------------
--------------------------------------------------------------------------------
local purpleSciencePackTech = string.format(scienceNames.purple, "pack")
LSlib.technology.changeIcon(purpleSciencePackTech, scienceTech.icon .. "potion-purple.png", scienceTech.icon_size)

LSlib.technology.removeIngredient(purpleSciencePackTech,    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (purpleSciencePackTech, 2, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (purpleSciencePackTech, 3, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient   (purpleSciencePackTech, 4, string.format(scienceNames.cyan  , "pack"))
LSlib.technology.removeIngredient(purpleSciencePackTech,    string.format(scienceNames.blue  , "pack"))
LSlib.technology.addIngredient   (purpleSciencePackTech, 5, string.format(scienceNames.blue  , "pack"))

LSlib.technology.addRecipeUnlock(purpleSciencePackTech, string.format(scienceNames.purple, "fluid"))
for _,barreling in pairs({
  "fill-",  -- Filling barrel recipe
  "empty-", -- Empty barrel recipe
}) do
  LSlib.technology.addRecipeUnlock(purpleSciencePackTech, barreling..string.format(scienceNames.purple, "fluid").."-barrel")
end
LSlib.technology.addPrerequisite(purpleSciencePackTech, "fluid-handling-3")
for _,recipeEffect in pairs{
  "sct-prod-biosilicate", "sct-prod-baked-biopaste", "sct-prod-bioprocessor",
  "sct-prod-overclocker", "sct-prod-chipcase",
  "sct-waste-processing-mixed",
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(purpleSciencePackTech, purpleSciencePackTech, recipeEffect)
end



-- yellow science pack ---------------------------------------------------------
--------------------------------------------------------------------------------
local yellowSciencePackTech = string.format(scienceNames.yellow, "pack")
LSlib.technology.changeIcon(yellowSciencePackTech, scienceTech.icon .. "potion-yellow.png", scienceTech.icon_size)

LSlib.technology.removeIngredient(yellowSciencePackTech,    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (yellowSciencePackTech, 2, string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (yellowSciencePackTech, 3, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient   (yellowSciencePackTech, 4, string.format(scienceNames.cyan  , "pack"))
LSlib.technology.removeIngredient(yellowSciencePackTech,    string.format(scienceNames.blue  , "pack"))
LSlib.technology.addIngredient   (yellowSciencePackTech, 5, string.format(scienceNames.blue  , "pack"))

LSlib.technology.addRecipeUnlock(yellowSciencePackTech, string.format(scienceNames.yellow, "fluid"))
for _,barreling in pairs({
  "fill-",  -- Filling barrel recipe
  "empty-", -- Empty barrel recipe
}) do
  LSlib.technology.addRecipeUnlock(yellowSciencePackTech, barreling..string.format(scienceNames.yellow, "fluid").."-barrel")
end
LSlib.technology.addPrerequisite(yellowSciencePackTech, "fluid-handling-3")
for _,recipeEffect in pairs{
  "sct-htech-thermalstore", "sct-htech-thermalstore-heated", "sct-htech-capbank",
  "sct-htech-random",
  "sct-waste-processing-copper", "sct-waste-processing-mixed"
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(yellowSciencePackTech, yellowSciencePackTech, recipeEffect)
end



-- pink science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
local pinkSciencePackTech = string.format(scienceNames.pink, "pack")

--LSlib.technology.addRecipeUnlock(pinkSciencePackTech, string.format(scienceNames.pink, "fluid"))
for _,recipeEffect in pairs{
  string.format(scienceNames.pink, "fluid"),
  "fill-" ..string.format(scienceNames.pink, "fluid").."-barrel",
  "empty-"..string.format(scienceNames.pink, "fluid").."-barrel",
} do -- this is for ordering purpose only
  LSlib.technology.moveRecipeUnlock(pinkSciencePackTech, pinkSciencePackTech, recipeEffect)
end

LSlib.technology.addRecipeUnlock(pinkSciencePackTech, "sct-logistic-cargo-unit"       )
LSlib.technology.addRecipeUnlock(pinkSciencePackTech, "sct-logistic-unimover"         )
LSlib.technology.addRecipeUnlock(pinkSciencePackTech, "sct-logistic-automated-storage")
LSlib.technology.addRecipeUnlock(pinkSciencePackTech, "sct-logistic-memory-unit"      )

if mods["MoreScience-BobAngelsExtension"] then
  for _,recipeEffect in pairs{
    "sct-logistic-cargo-unit"       ,
    "sct-logistic-unimover"         ,
    "sct-logistic-automated-storage",
    "sct-logistic-memory-unit"      ,
  } do -- this is for ordering purpose only
    LSlib.technology.moveRecipeUnlock(pinkSciencePackTech, pinkSciencePackTech, recipeEffect)
  end

  LSlib.technology.removeIngredient(pinkSciencePackTech,    string.format(scienceNames.red   , "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 1, string.format(scienceNames.red   , "pack"))
  LSlib.technology.removeIngredient(pinkSciencePackTech,    string.format(scienceNames.green , "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 2, string.format(scienceNames.green , "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 2, string.format(scienceNames.gray  , "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 3, string.format(scienceNames.orange, "pack"))
  LSlib.technology.removeIngredient(pinkSciencePackTech,    string.format(scienceNames.blue  , "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 4, string.format(scienceNames.blue  , "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 5, string.format(scienceNames.purple, "pack"))
  LSlib.technology.addIngredient   (pinkSciencePackTech, 5, string.format(scienceNames.yellow, "pack"))
end



-- white science pack ----------------------------------------------------------
--------------------------------------------------------------------------------
local whiteSciencePackTech = string.format(scienceNames.white, "pack")

LSlib.technology.removeIngredient(whiteSciencePackTech,    string.format(scienceNames.red   , "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 1, string.format(scienceNames.red   , "pack"))
LSlib.technology.removeIngredient(whiteSciencePackTech,    string.format(scienceNames.green , "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 2, string.format(scienceNames.green , "pack"))
LSlib.technology.removeIngredient(whiteSciencePackTech,    string.format(scienceNames.gray  , "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 2, string.format(scienceNames.gray  , "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 3, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 3, string.format(scienceNames.cyan  , "pack"))
LSlib.technology.removeIngredient(whiteSciencePackTech,    string.format(scienceNames.blue  , "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 4, string.format(scienceNames.blue  , "pack"))
LSlib.technology.removeIngredient(whiteSciencePackTech,    string.format(scienceNames.purple, "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 4, string.format(scienceNames.purple, "pack"))
LSlib.technology.removeIngredient(whiteSciencePackTech,    string.format(scienceNames.yellow, "pack"))
LSlib.technology.addIngredient   (whiteSciencePackTech, 4, string.format(scienceNames.yellow, "pack"))
if mods["MoreScience-BobAngelsExtension"] then
  -- in case of bobs mods this could be present
  LSlib.technology.removeIngredient(whiteSciencePackTech,  string.format(scienceNames.pink  , "pack"))
end
LSlib.technology.addIngredient   (whiteSciencePackTech, 5, string.format(scienceNames.pink  , "pack"))

LSlib.technology.addRecipeUnlock (whiteSciencePackTech, string.format(scienceNames.white, "pack" )                 )
LSlib.technology.addRecipeUnlock (whiteSciencePackTech, string.format(scienceNames.white, "fluid")                 )
for _,barreling in pairs({
  "fill-",  -- Filling barrel recipe
  "empty-", -- Empty barrel recipe
}) do
  LSlib.technology.addRecipeUnlock(whiteSciencePackTech,
                                                   barreling..string.format(scienceNames.white, "fluid").."-barrel")
end
LSlib.technology.addRecipeUnlock (whiteSciencePackTech, string.format(rocketParts.container, "mk1")                )
LSlib.technology.addRecipeUnlock (whiteSciencePackTech, string.format(rocketParts.payload  , "mk1", "empty-bottle"))
LSlib.technology.moveRecipeUnlock(whiteSciencePackTech, whiteSciencePackTech                      , "satellite"    ) -- this is just for unlock ordening
LSlib.technology.addRecipeUnlock (whiteSciencePackTech, "infused-"..string.format(scienceNames.white , "pack")     )
