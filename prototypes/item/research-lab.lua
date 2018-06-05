require "lib/utilities/util"

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
-- change module slots
data.raw["item"]["lab-burner"].module_specification = deepcopy(data.raw["item"]["lab"].module_specification)
data.raw["item"]["lab-burner"].order = "d[lab]-a"



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- change localized name
data.raw["item"]["lab"].localised_name = data.raw["lab"]["lab"].localised_name
-- change subgroup
data.raw["item"]["lab"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["lab"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "b"



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["sct-lab-2"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-2"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "c"



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["sct-lab-3"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-3"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "d"



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["sct-lab-4"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-4"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "e"



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["lab-mk2"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["lab-mk2"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "f"
