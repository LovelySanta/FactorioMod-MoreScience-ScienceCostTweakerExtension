require "lib/utilities/prototyping"

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
-- remove subgroup
data.raw["recipe"]["lab-burner"].subgroup = nil
data.raw["recipe"]["lab-burner"].order = nil


--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- remove subgroup
data.raw["recipe"]["lab"].subgroup = nil
data.raw["recipe"]["lab"].order = nil
-- add previous lab as ingredient
addRecipeIngredient("lab", "lab-burner", 1)



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
-- remove subgroup
data.raw["recipe"]["sct-lab-2"].subgroup = nil
data.raw["recipe"]["sct-lab-2"].order = nil



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
-- remove subgroup
data.raw["recipe"]["sct-lab-3"].subgroup = nil
data.raw["recipe"]["sct-lab-3"].order = nil



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
-- remove subgroup
data.raw["recipe"]["sct-lab-4"].subgroup = nil
data.raw["recipe"]["sct-lab-4"].order = nil



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- remove subgroup
data.raw["recipe"]["lab-mk2"].subgroup = nil
data.raw["recipe"]["lab-mk2"].order = nil
-- add previous lab as ingredient
addRecipeIngredient("lab-mk2", "sct-lab-4", 1)
removeRecipeIngredient("lab-mk2", "lab")
