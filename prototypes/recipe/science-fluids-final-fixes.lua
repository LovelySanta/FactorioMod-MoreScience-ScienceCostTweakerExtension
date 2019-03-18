local scienceNames         = require("prototypes/settings").scienceNames
local fluidsPerPack        = require("prototypes/settings").fluidsPerPack
local ingredientMultiplier = require("prototypes/settings").ingredientMultiplier



--------------------------------------------------------------------------------
----- bottling science packs (vanilla packs only, and except white)        -----
--------------------------------------------------------------------------------
local function transferRecipeIngredients(scienceName)
  local packName         = string.format(scienceName, "pack" )
  local fluidName        = string.format(scienceName, "fluid")
  local recipeMultiplier = ingredientMultiplier[scienceName]

  if not data.raw["recipe"][packName] then return end

  if data.raw["recipe"][packName].ingredients then
    for _,ingredient in pairs(data.raw["recipe"][packName].ingredients) do
      if ingredient.name then
        LSlib.recipe.addIngredient(fluidName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        LSlib.recipe.removeIngredient(packName, ingredient.name)
      elseif ingredient[1] then
        LSlib.recipe.addIngredient(fluidName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        LSlib.recipe.removeIngredient(packName, ingredient[1])
      end
    end
  end

  if data.raw["recipe"][packName].normal then
    for _,ingredient in pairs(data.raw["recipe"][packName].normal.ingredients) do
      if ingredient.name then
        LSlib.recipe.addIngredient(fluidName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        LSlib.recipe.removeIngredient(packName, ingredient.name)
      elseif ingredient[1] then
        LSlib.recipe.addIngredient(fluidName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        LSlib.recipe.removeIngredient(packName, ingredient[1])
      end
    end
  end

  if data.raw["recipe"][packName].expensive then
    for _,ingredient in pairs(data.raw["recipe"][packName].expensive.ingredients) do
      if ingredient.name then
        LSlib.recipe.addIngredient(fluidName, ingredient.name, ingredient.amount * recipeMultiplier, "item")
        LSlib.recipe.removeIngredient(packName, ingredient.name)
      elseif ingredient[1] then
        LSlib.recipe.addIngredient(fluidName, ingredient[1], ingredient[2] * recipeMultiplier, "item")
        LSlib.recipe.removeIngredient(packName, ingredient[1])
      end
    end
  end

end



for _,scienceName in pairs{
  scienceNames.red   ,
  scienceNames.green ,
  scienceNames.gray  ,
  scienceNames.blue  ,
  scienceNames.purple,
  scienceNames.yellow,
} do
  local packName  = string.format(scienceName, "pack" )
  local fluidName = string.format(scienceName, "fluid")
  local recipeResultMultiplier = LSlib.recipe.getResultCount(packName, packName)

  -- remove the old ingredients
  local ingredients = util.table.deepcopy(
    data.raw["recipe"][fluidName]          .ingredients or
    data.raw["recipe"][fluidName].normal   .ingredients or
    data.raw["recipe"][fluidName].expensive.ingredients )

  for _,ingredient in pairs(ingredients) do
    if (ingredient["type"] or "item") ~= "fluid" then
      LSlib.recipe.removeIngredient(fluidName, ingredient["name"] or ingredient[1])
    end
  end

  -- add the new ingredients
  transferRecipeIngredients(scienceName)

  -- add the new ingredients to the science pack
  LSlib.recipe.addIngredient(packName, fluidName, fluidsPerPack, "fluid")
  LSlib.recipe.addIngredient(packName, "empty-bottle", 1)
end


--[[


--------------------------------------------------------------------------------
----- Basic logistics science pack                                         -----
--------------------------------------------------------------------------------
LSlib.recipe.removeIngredient("basic-logistics-science-fluid", "electric-engine-unit")
LSlib.recipe.addIngredient("basic-logistics-science-fluid", "sct-logistic-cargo-unit", 5, "item")
LSlib.recipe.addIngredient("basic-logistics-science-fluid", "sct-logistic-memory-unit", 5, "item")
--LSlib.recipe.addIngredient("basic-logistics-science-fluid", "electric-furnace", 5)

if settings.startup["bobmods-logistics-inserteroverhaul"] and settings.startup["bobmods-logistics-inserteroverhaul"].value then
  LSlib.recipe.editIngredient("sct-logistic-automated-storage", "filter-inserter", "red-filter-inserter", 1)
end
]]
