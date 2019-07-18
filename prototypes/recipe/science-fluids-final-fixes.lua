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
