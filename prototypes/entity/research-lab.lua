require "lib/utilities/util"

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
-- quick replacement
data.raw["lab"]["lab-burner"].fast_replaceable_group = data.raw["lab"]["lab"].fast_replaceable_group
-- change inputs
data.raw["lab"]["lab-burner"].inputs =
{
  "science-pack-1",
}


--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab1_on_animation = deepcopy(data.raw["lab"]["lab"].on_animation)
local lab1_off_animation = deepcopy(data.raw["lab"]["lab"].off_animation)
data.raw["lab"]["lab"].on_animation = deepcopy(data.raw["lab"]["lab-burner"].on_animation)
data.raw["lab"]["lab"].off_animation = deepcopy(data.raw["lab"]["lab-burner"].off_animation)
-- change inputs
data.raw["lab"]["lab"].inputs = deepcopy(data.raw["lab"]["lab-burner"].inputs)
table.insert(data.raw["lab"]["lab"].inputs, "science-pack-2")
table.insert(data.raw["lab"]["lab"].inputs, "military-science-pack")
table.insert(data.raw["lab"]["lab"].inputs, "basic-automation-science-pack")
table.insert(data.raw["lab"]["lab"].inputs, "basic-power-science-pack")
-- change localized name
data.raw["lab"]["lab"].localised_name = {"item-name.lab"}



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab2_on_animation = deepcopy(data.raw["lab"]["sct-lab-2"].on_animation)
local lab2_off_animation = deepcopy(data.raw["lab"]["sct-lab-2"].off_animation)
data.raw["lab"]["sct-lab-2"].on_animation = deepcopy(lab1_on_animation)
data.raw["lab"]["sct-lab-2"].off_animation = deepcopy(lab1_off_animation)
-- change inputs
data.raw["lab"]["sct-lab-2"].inputs = deepcopy(data.raw["lab"]["lab"].inputs)
table.insert(data.raw["lab"]["sct-lab-2"].inputs, "science-pack-3")



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab3_on_animation = deepcopy(data.raw["lab"]["sct-lab-3"].on_animation)
local lab3_off_animation = deepcopy(data.raw["lab"]["sct-lab-3"].off_animation)
data.raw["lab"]["sct-lab-3"].on_animation = deepcopy(lab2_on_animation)
data.raw["lab"]["sct-lab-3"].off_animation = deepcopy(lab2_off_animation)
-- change inputs
data.raw["lab"]["sct-lab-3"].inputs = deepcopy(data.raw["lab"]["sct-lab-2"].inputs)
table.insert(data.raw["lab"]["sct-lab-3"].inputs, "production-science-pack")
table.insert(data.raw["lab"]["sct-lab-3"].inputs, "basic-logistics-science-pack")



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
-- change animation
local lab4_on_animation = deepcopy(data.raw["lab"]["sct-lab-4"].on_animation)
local lab4_off_animation = deepcopy(data.raw["lab"]["sct-lab-4"].off_animation)
data.raw["lab"]["sct-lab-4"].on_animation = deepcopy(lab3_on_animation)
data.raw["lab"]["sct-lab-4"].off_animation = deepcopy(lab3_off_animation)
-- change inputs
data.raw["lab"]["sct-lab-4"].inputs = deepcopy(data.raw["lab"]["sct-lab-3"].inputs)
table.insert(data.raw["lab"]["sct-lab-4"].inputs, "high-tech-science-pack")
table.insert(data.raw["lab"]["sct-lab-4"].inputs, "space-science-pack")
-- change power consumption
data.raw["lab"]["sct-lab-4"].energy_usage = "750kW"



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- change animation
data.raw["lab"]["lab-mk2"].on_animation = deepcopy(lab4_on_animation)
data.raw["lab"]["lab-mk2"].off_animation = deepcopy(lab4_off_animation)
-- change input order
for inputIndex, sciencePackName in pairs(data.raw["lab"]["sct-lab-4"].inputs) do
  local infusedSciencePackName = {
    ["science-pack-1"] = "infused-basic-science-pack-1",
    ["science-pack-2"] = "infused-basic-science-pack-2",
    ["science-pack-3"] = "infused-basic-science-pack-3",
    ["production-science-pack"] = "infused-advanced-science-pack-1",
    ["high-tech-science-pack"] = "infused-advanced-science-pack-2",
    ["space-science-pack"] = "infused-extreme-science-pack",
    ["military-science-pack"] = "infused-basic-military-science-pack",
    ["basic-automation-science-pack"] = "infused-basic-automation-science-pack",
    ["basic-logistics-science-pack"] = "infused-basic-logistics-science-pack",
    ["basic-power-science-pack"] = "infused-basic-power-science-pack",
  }
  data.raw["lab"]["lab-mk2"].inputs[inputIndex] = infusedSciencePackName[sciencePackName]
end
-- change power consumption
data.raw["lab"]["lab-mk2"].energy_usage = "2MW"
-- change max healt
data.raw["lab"]["lab-mk2"].max_health = 350
-- change module slots
data.raw["lab"]["lab-mk2"].module_specification = deepcopy(data.raw["lab"]["sct-lab-4"].module_specification)
-- quick replacement
data.raw["lab"]["lab-mk2"].fast_replaceable_group = data.raw["lab"]["lab"].fast_replaceable_group
