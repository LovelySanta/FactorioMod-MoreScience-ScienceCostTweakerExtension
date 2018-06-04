require "lib/utilities/util"

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
-- quick replacement
data.raw["lab"]["lab-burner"].fast_replaceable_group = data.raw["lab"]["lab"].fast_replaceable_group



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab1_on_animation = deepcopy(data.raw["lab"]["lab"].on_animation)
local lab1_off_animation = deepcopy(data.raw["lab"]["lab"].off_animation)
data.raw["lab"]["lab"].on_animation = deepcopy(data.raw["lab"]["lab-burner"].on_animation)
data.raw["lab"]["lab"].off_animation = deepcopy(data.raw["lab"]["lab-burner"].off_animation)



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab2_on_animation = deepcopy(data.raw["lab"]["sct-lab-2"].on_animation)
local lab2_off_animation = deepcopy(data.raw["lab"]["sct-lab-2"].off_animation)
data.raw["lab"]["sct-lab-2"].on_animation = deepcopy(lab1_on_animation)
data.raw["lab"]["sct-lab-2"].off_animation = deepcopy(lab1_off_animation)



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab3_on_animation = deepcopy(data.raw["lab"]["sct-lab-3"].on_animation)
local lab3_off_animation = deepcopy(data.raw["lab"]["sct-lab-3"].off_animation)
data.raw["lab"]["sct-lab-3"].on_animation = deepcopy(lab2_on_animation)
data.raw["lab"]["sct-lab-3"].off_animation = deepcopy(lab2_off_animation)



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab4_on_animation = deepcopy(data.raw["lab"]["sct-lab-4"].on_animation)
local lab4_off_animation = deepcopy(data.raw["lab"]["sct-lab-4"].off_animation)
data.raw["lab"]["sct-lab-4"].on_animation = deepcopy(lab3_on_animation)
data.raw["lab"]["sct-lab-4"].off_animation = deepcopy(lab3_off_animation)
-- change power consumption
data.raw["lab"]["sct-lab-4"].energy_usage = "750kW"



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- change animation
data.raw["lab"]["lab-mk2"].on_animation = deepcopy(lab4_on_animation)
data.raw["lab"]["lab-mk2"].off_animation = deepcopy(lab4_off_animation)
-- change power consumption
data.raw["lab"]["lab-mk2"].energy_usage = "2MW"
-- change module slots
data.raw["lab"]["lab-mk2"].module_specification = deepcopy(data.raw["lab"]["sct-lab-4"].module_specification)
-- quick replacement
data.raw["lab"]["lab-mk2"].fast_replaceable_group = data.raw["lab"]["lab"].fast_replaceable_group
