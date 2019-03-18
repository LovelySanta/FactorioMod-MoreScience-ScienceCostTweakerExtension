
--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = "lab-mk0"
-- remove subgroup
LSlib.recipe.setSubgroup   (labMK0, nil)
LSlib.recipe.setOrderstring(labMK0, nil)



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
local labMK1 = "lab"
-- remove subgroup
LSlib.recipe.setSubgroup   (labMK1, nil)
LSlib.recipe.setOrderstring(labMK1, nil)
LSlib.recipe.addIngredient (labMK1, labMK0, 1, "item")



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = "sct-lab-t2"
-- remove subgroup
LSlib.recipe.setSubgroup   (labMK2, nil)
LSlib.recipe.setOrderstring(labMK2, nil)



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
local labMK3 = "sct-lab-t3"
-- remove subgroup
LSlib.recipe.setSubgroup   (labMK3, nil)
LSlib.recipe.setOrderstring(labMK3, nil)



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
local labMK4 = "sct-lab-t4"
-- remove subgroup
LSlib.recipe.setSubgroup   (labMK4, nil)
LSlib.recipe.setOrderstring(labMK4, nil)



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
local labMK5 = "lab-mk2"
-- remove subgroup
LSlib.recipe.setSubgroup   (labMK5, nil)
LSlib.recipe.setOrderstring(labMK5, nil)

-- add previous lab as ingredient
LSlib.recipe.editIngredient(labMK5, "lab", labMK4, 1)


--[[
--------------------------------------------------------------------------------
----- module lab                                                          -----
--------------------------------------------------------------------------------
if data.raw["recipe"]["lab-module"] then
  -- remove subgroup
  data.raw["recipe"]["lab-module"].subgroup = nil
  data.raw["recipe"]["lab-module"].order = nil
end


--------------------------------------------------------------------------------
----- alien lab                                                          -----
--------------------------------------------------------------------------------
if data.raw["recipe"]["lab-alien"] then
  -- remove subgroup
  data.raw["recipe"]["lab-alien"].subgroup = nil
  data.raw["recipe"]["lab-alien"].order = nil
end
]]
