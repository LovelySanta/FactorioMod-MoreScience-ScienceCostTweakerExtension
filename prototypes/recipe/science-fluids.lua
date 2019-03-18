local scienceNames = require("prototypes/settings").scienceNames

-- pink science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
local pinkScienceFluid = string.format(scienceNames.pink, "fluid")

LSlib.recipe.removeIngredient(pinkScienceFluid         , "rocket-control-unit")
LSlib.recipe.addIngredient   ("sct-logistic-cargo-unit", "rocket-control-unit")

LSlib.recipe.removeIngredient(pinkScienceFluid                , "effectivity-module"   )
LSlib.recipe.addIngredient   ("sct-logistic-automated-storage", "effectivity-module", 2)

LSlib.recipe.addIngredient   (pinkScienceFluid, "sct-logistic-cargo-unit" )
LSlib.recipe.addIngredient   (pinkScienceFluid, "sct-logistic-memory-unit")
