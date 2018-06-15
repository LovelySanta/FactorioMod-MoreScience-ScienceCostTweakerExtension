require 'util'

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
-- burner lab gets same icon as regular lab
data.raw["lab"]["lab-burner"].on_animation = util.table.deepcopy(data.raw["lab"]["lab"].on_animation)
data.raw["lab"]["lab-burner"].off_animation = util.table.deepcopy(data.raw["lab"]["lab"].off_animation)
data.raw["lab"]["lab"].localised_name = {"item-name.lab"}
-- quick replacement
data.raw["lab"]["lab-burner"].fast_replaceable_group = data.raw["lab"]["lab"].fast_replaceable_group



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
data.raw["lab"]["lab"].inputs =
{
  "science-pack-1",
  "science-pack-2",
  "military-science-pack",
  "basic-automation-science-pack",
  --"basic-power-science-pack",
}
-- change localized name
data.raw["lab"]["lab"].localised_name = {"item-name.lab"}


--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
data.raw["lab"]["sct-lab-t2"].inputs =
{
  "science-pack-1",
  "science-pack-2",
  "military-science-pack",
  "basic-automation-science-pack",
  "science-pack-3",
  "basic-power-science-pack",
}



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
data.raw["lab"]["sct-lab-t3"].inputs =
{
  "science-pack-1",
  "science-pack-2",
  "military-science-pack",
  "basic-automation-science-pack",
  "science-pack-3",
  "basic-power-science-pack",
  "production-science-pack",
  "basic-logistics-science-pack",
}



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
data.raw["lab"]["sct-lab-t4"].inputs =
{
  "science-pack-1",
  "science-pack-2",
  "military-science-pack",
  "basic-automation-science-pack",
  "science-pack-3",
  "basic-power-science-pack",
  "production-science-pack",
  "basic-logistics-science-pack",
  "high-tech-science-pack",
  "space-science-pack",
}
-- change power consumption
data.raw["lab"]["sct-lab-t4"].energy_usage = "750kW"



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- change power consumption
data.raw["lab"]["lab-mk2"].energy_usage = "2MW"
-- change max healt
data.raw["lab"]["lab-mk2"].max_health = 350
-- change module slots
data.raw["lab"]["lab-mk2"].module_specification = util.table.deepcopy(data.raw["lab"]["sct-lab-t4"].module_specification)
-- quick replacement
data.raw["lab"]["lab-mk2"].fast_replaceable_group = data.raw["lab"]["lab"].fast_replaceable_group
