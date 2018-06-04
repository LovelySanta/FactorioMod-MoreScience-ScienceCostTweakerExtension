require "lib/utilities/util"

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
data.raw["item"]["lab-burner"].inputs =
{
  "science-pack-1",
}
-- change module slots
data.raw["item"]["lab-burner"].module_specification = deepcopy(data.raw["item"]["lab"].module_specification)
data.raw["item"]["lab-burner"].order = "d[lab]-a"



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- change inputs
data.raw["item"]["lab"].inputs = deepcopy(data.raw["item"]["lab-burner"].inputs)
table.insert(data.raw["item"]["lab"].inputs, "science-pack-2")
table.insert(data.raw["item"]["lab"].inputs, "military-science-pack")
table.insert(data.raw["item"]["lab"].inputs, "basic-automation-science-pack")
-- change localized name
data.raw["item"]["lab"].localized_name = {"item-name.lab"}
-- change subgroup
data.raw["item"]["lab"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["lab"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "b"



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
-- change inputs
data.raw["item"]["sct-lab-2"].inputs = deepcopy(data.raw["item"]["lab"].inputs)
table.insert(data.raw["item"]["sct-lab-2"].inputs, "science-pack-3")
table.insert(data.raw["item"]["sct-lab-2"].inputs, "basic-power-science-pack")
-- change subgroup
data.raw["item"]["sct-lab-2"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-2"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "c"



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
-- change inputs
data.raw["item"]["sct-lab-3"].inputs = deepcopy(data.raw["item"]["sct-lab-2"].inputs)
table.insert(data.raw["item"]["sct-lab-3"].inputs, "production-science-pack")
table.insert(data.raw["item"]["sct-lab-3"].inputs, "basic-logistics-science-pack")
-- change subgroup
data.raw["item"]["sct-lab-3"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-3"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "d"



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
-- change inputs
data.raw["item"]["sct-lab-4"].inputs = deepcopy(data.raw["item"]["sct-lab-3"].inputs)
table.insert(data.raw["item"]["sct-lab-4"].inputs, "high-tech-science-pack")
table.insert(data.raw["item"]["sct-lab-4"].inputs, "space-science-pack")
-- change subgroup
data.raw["item"]["sct-lab-4"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-4"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "e"



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- change localized name
data.raw["item"]["lab-mk2"].localized_name = {"item-name.lab-mk2"}
-- change subgroup
data.raw["item"]["lab-mk2"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["lab-mk2"].order = stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "f"
