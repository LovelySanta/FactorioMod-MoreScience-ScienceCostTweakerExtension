local scienceNames     = require("prototypes/settings").scienceNames

--------------------------------------------------------------------------------
----- red science pack basic (manual craftable)                            -----
--------------------------------------------------------------------------------
local redSciencePack = string.format(scienceNames.red, "pack")
local redSciencePackBasic = redSciencePack .. "-basic"

--[[
-- remove the old ingredients
local ingredients = util.table.deepcopy(
  data.raw["recipe"][redSciencePackBasic]          .ingredients or
  data.raw["recipe"][redSciencePackBasic].normal   .ingredients or
  data.raw["recipe"][redSciencePackBasic].expensive.ingredients )

for _,ingredient in pairs(ingredients) do
  if (ingredient["type"] or "item") ~= "fluid" then
    LSlib.recipe.removeIngredient(redSciencePackBasic, ingredient["name"] or ingredient[1])
  end
end

-- add the new ingredients
ingredients = util.table.deepcopy(
  data.raw["recipe"][redSciencePack]          .ingredients or
  data.raw["recipe"][redSciencePack].normal   .ingredients or
  data.raw["recipe"][redSciencePack].expensive.ingredients )

for _,ingredient in pairs(ingredients) do
  if (ingredient["type"] or "item") ~= "fluid" then
    LSlib.recipe.addIngredient(redSciencePackBasic                       ,
                               ingredient["name"] or ingredient[1]       ,
                               ingredient["amount"] or ingredient[2] or 1,
                               ingredient["type"]                        )
  end
end
]]



--------------------------------------------------------------------------------
----- regular science packs                                                -----
--------------------------------------------------------------------------------
for _,scienceName in pairs(scienceNames) do
  LSlib.recipe.setCraftingCategory(string.format(scienceName, "pack"), "ms-advanced-crafting")
  LSlib.recipe.setSubgroup        (string.format(scienceName, "pack"), nil                   )
  LSlib.recipe.setOrderstring     (string.format(scienceName, "pack"), nil                   )

  if scienceName ~= scienceNames.white then
    LSlib.recipe.setResultCount   (string.format(scienceName, "pack"), string.format(scienceName, "pack"), 1)
  end
end
