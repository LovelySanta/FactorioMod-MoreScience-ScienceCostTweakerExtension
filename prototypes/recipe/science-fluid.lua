
-- use the new intermediate products that the science packs require
local function transferRecipeIngredients(copyRecipeName, pasteRecipeName, recipeMultiplier)
  if not data.raw["recipe"][copyRecipeName] then return end

  if data.raw["recipe"][copyRecipeName].ingredients then
    for _,ingredient in pairs(data.raw["recipe"][copyRecipeName].ingredients) do
      if ingredient.name then
        MoreScience.lib.recipe.addIngredient(pasteRecipeName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        MoreScience.lib.recipe.removeIngredient(copyRecipeName, ingredient.name)
      elseif ingredient[1] then
        MoreScience.lib.recipe.addIngredient(pasteRecipeName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        MoreScience.lib.recipe.removeIngredient(copyRecipeName, ingredient[1])
      end
    end
  end

  if data.raw["recipe"][copyRecipeName].normal then
    for _,ingredient in pairs(data.raw["recipe"][copyRecipeName].normal.ingredients) do
      if ingredient.name then
        MoreScience.lib.recipe.addIngredient(pasteRecipeName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        MoreScience.lib.recipe.removeIngredient(copyRecipeName, ingredient.name)
      elseif ingredient[1] then
        MoreScience.lib.recipe.addIngredient(pasteRecipeName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        MoreScience.lib.recipe.removeIngredient(copyRecipeName, ingredient[1])
      end
    end
  end

  if data.raw["recipe"][copyRecipeName].expensive then
    for _,ingredient in pairs(data.raw["recipe"][copyRecipeName].expensive.ingredients) do
      if ingredient.name then
        MoreScience.lib.recipe.addIngredient(pasteRecipeName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        MoreScience.lib.recipe.removeIngredient(copyRecipeName, ingredient.name)
      elseif ingredient[1] then
        MoreScience.lib.recipe.addIngredient(pasteRecipeName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        MoreScience.lib.recipe.removeIngredient(copyRecipeName, ingredient[1])
      end
    end
  end

end



--------------------------------------------------------------------------------
----- Science pack 1                                                       -----
--------------------------------------------------------------------------------



--------------------------------------------------------------------------------
----- Science pack 2                                                       -----
--------------------------------------------------------------------------------
transferRecipeIngredients("science-pack-2", "basic-science-fluid-2" ,5)
MoreScience.lib.recipe.editIngredient("basic-science-fluid-2", "long-handed-inserter", "fast-inserter", 1) -- bob inserter overhaul changes fast to long handed
MoreScience.lib.recipe.removeIngredient("basic-science-fluid-2", "fast-inserter")



--------------------------------------------------------------------------------
----- Science pack 3                                                       -----
--------------------------------------------------------------------------------
transferRecipeIngredients("science-pack-3", "basic-science-fluid-3" ,4)
MoreScience.lib.recipe.removeIngredient("basic-science-fluid-3", "advanced-circuit")

for _, ingredient in pairs(data.raw["recipe"]["basic-science-fluid-3"].ingredients) do
  if ingredient.name == "bronze-alloy" then
    MoreScience.lib.recipe.removeIngredient("basic-science-fluid-3", "bronze-alloy")
    MoreScience.lib.recipe.addIngredient("sct-t3-flash-fuel", "bronze-alloy", 1, "item")
    break
  end
end



--------------------------------------------------------------------------------
----- Military science pack                                                -----
--------------------------------------------------------------------------------
transferRecipeIngredients("military-science-pack", "basic-military-science-fluid" ,2)
MoreScience.lib.recipe.removeIngredient("basic-military-science-fluid", "gun-turret")
MoreScience.lib.recipe.removeIngredient("basic-military-science-fluid", "piercing-rounds-magazine")



--------------------------------------------------------------------------------
----- Production science pack                                              -----
--------------------------------------------------------------------------------
transferRecipeIngredients("production-science-pack", "advanced-science-fluid-1" ,2)
MoreScience.lib.recipe.removeIngredient("advanced-science-fluid-1", "electric-furnace")



--------------------------------------------------------------------------------
----- High tech science pack                                               -----
--------------------------------------------------------------------------------
transferRecipeIngredients("high-tech-science-pack", "advanced-science-fluid-2" ,2)
MoreScience.lib.recipe.removeIngredient("advanced-science-fluid-2", "processing-unit")



--------------------------------------------------------------------------------
----- Basic automation science pack                                        -----
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
----- Basic power science pack                                             -----
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
----- Basic logistics science pack                                         -----
--------------------------------------------------------------------------------
MoreScience.lib.recipe.removeIngredient("basic-logistics-science-fluid", "electric-engine-unit")
MoreScience.lib.recipe.addIngredient("basic-logistics-science-fluid", "sct-logistic-cargo-unit", 5, "item")
MoreScience.lib.recipe.addIngredient("basic-logistics-science-fluid", "sct-logistic-memory-unit", 5, "item")
--MoreScience.lib.recipe.addIngredient("basic-logistics-science-fluid", "electric-furnace", 5)

if settings.startup["bobmods-logistics-inserteroverhaul"] and settings.startup["bobmods-logistics-inserteroverhaul"].value then
  MoreScience.lib.recipe.editIngredient("sct-logistic-automated-storage", "filter-inserter", "red-filter-inserter", 1)
end
