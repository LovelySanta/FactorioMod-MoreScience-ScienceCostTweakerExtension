require "lib/utilities/prototyping"



-- use the new intermediate products that the science packs require
local function transferRecipeIngredients(copyRecipeName, pasteRecipeName, recipeMultiplier)
  if not data.raw["recipe"][copyRecipeName] then return end

  if data.raw["recipe"][copyRecipeName].ingredients then
    for _,ingredient in pairs(data.raw["recipe"][copyRecipeName].ingredients) do
      if ingredient.name then
        addRecipeIngredient(pasteRecipeName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        removeRecipeIngredient(copyRecipeName, ingredient.name)
      elseif ingredient[1] then
        addRecipeIngredient(pasteRecipeName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        removeRecipeIngredient(copyRecipeName, ingredient[1])
      end
    end
  end

  if data.raw["recipe"][copyRecipeName].normal then
    for _,ingredient in pairs(data.raw["recipe"][copyRecipeName].normal.ingredients) do
      if ingredient.name then
        addRecipeIngredient(pasteRecipeName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        removeRecipeIngredient(copyRecipeName, ingredient.name)
      elseif ingredient[1] then
        addRecipeIngredient(pasteRecipeName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        removeRecipeIngredient(copyRecipeName, ingredient[1])
      end
    end
  end

  if data.raw["recipe"][copyRecipeName].expensive then
    for _,ingredient in pairs(data.raw["recipe"][copyRecipeName].expensive.ingredients) do
      if ingredient.name then
        addRecipeIngredient(pasteRecipeName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        removeRecipeIngredient(copyRecipeName, ingredient.name)
      elseif ingredient[1] then
        addRecipeIngredient(pasteRecipeName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        removeRecipeIngredient(copyRecipeName, ingredient[1])
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
removeRecipeIngredient("basic-science-fluid-2", "fast-inserter")



--------------------------------------------------------------------------------
----- Science pack 3                                                       -----
--------------------------------------------------------------------------------
transferRecipeIngredients("science-pack-3", "basic-science-fluid-3" ,4)
removeRecipeIngredient("basic-science-fluid-3", "advanced-circuit")



--------------------------------------------------------------------------------
----- Military science pack                                                -----
--------------------------------------------------------------------------------
transferRecipeIngredients("military-science-pack", "basic-military-science-fluid" ,2)
removeRecipeIngredient("basic-military-science-fluid", "gun-turret")
removeRecipeIngredient("basic-military-science-fluid", "piercing-rounds-magazine")


--------------------------------------------------------------------------------
----- Production science pack                                              -----
--------------------------------------------------------------------------------
transferRecipeIngredients("production-science-pack", "advanced-science-fluid-1" ,2)
removeRecipeIngredient("advanced-science-fluid-1", "electric-furnace")



--------------------------------------------------------------------------------
----- High tech science pack                                               -----
--------------------------------------------------------------------------------
transferRecipeIngredients("high-tech-science-pack", "advanced-science-fluid-2" ,2)
removeRecipeIngredient("advanced-science-fluid-2", "processing-unit")



--------------------------------------------------------------------------------
----- Basic automation science pack                                        -----
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
----- Basic power science pack                                             -----
--------------------------------------------------------------------------------




--------------------------------------------------------------------------------
----- Basic logistics science pack                                         -----
--------------------------------------------------------------------------------
removeRecipeIngredient("basic-logistics-science-fluid", "electric-engine-unit")
addRecipeIngredient("basic-logistics-science-fluid", "electric-furnace", 5)
