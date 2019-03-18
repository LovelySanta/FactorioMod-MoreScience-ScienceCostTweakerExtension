require 'util'
local scienceNames = require("prototypes/settings").scienceNames
local sciencePackOrderedNames = {
  scienceNames.red   ,
  scienceNames.green ,
  scienceNames.gray  ,
  scienceNames.orange,
  scienceNames.cyan  ,
  scienceNames.blue  ,
  scienceNames.purple,
  scienceNames.yellow,
  scienceNames.pink  ,
  scienceNames.white ,
}

local function removeSciencePackFromInputs(scienceName, inputs)
  for inputIndex,input in pairs(inputs or {}) do
    if input == string.format(scienceName, "pack") then
      table.remove(inputs, inputIndex)
      break
    end
  end
  return inputs
end

local function removeAllSciencePacksFromInputs(inputs)
  for _, scienceName in pairs(scienceNames) do
    inputs = removeSciencePackFromInputs(scienceName, inputs)
  end
  return inputs
end

--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
local labMK1 = "lab"

-- remove all inputs
local inputs = data.raw["lab"][labMK1].inputs
inputs = removeAllSciencePacksFromInputs(inputs)

-- add them back in the correct order
for scienceIndex,scienceName in pairs{
  sciencePackOrderedNames[1],
} do
  table.insert(inputs, scienceIndex, string.format(scienceName, "pack"))
end

-- change localized name
LSlib.entity.setLocalisedName("lab", labMK1, LSlib.item.getLocalisedName("item", labMK1))


--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = "lab-mk0"

-- burner lab gets same graphics as regular lab
data.raw["lab"][labMK0].on_animation  = util.table.deepcopy(data.raw["lab"][labMK1].on_animation )
data.raw["lab"][labMK0].off_animation = util.table.deepcopy(data.raw["lab"][labMK1].off_animation)
LSlib.entity.changeIcons("lab", labMK0, LSlib.item.getIcons("item", labMK0))

-- quick replacement
data.raw["lab"][labMK0].fast_replaceable_group = data.raw["lab"][labMK1].fast_replaceable_group



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = "sct-lab-t2"

-- remove all inputs
local inputs = data.raw["lab"][labMK2].inputs
inputs = removeAllSciencePacksFromInputs(inputs)

-- add them back in the correct order
for scienceIndex,scienceName in pairs{
  sciencePackOrderedNames[1],
  sciencePackOrderedNames[2],
  sciencePackOrderedNames[3],
  sciencePackOrderedNames[4],
  sciencePackOrderedNames[5],
} do
  table.insert(inputs, scienceIndex, string.format(scienceName, "pack"))
end



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
local labMK3 = "sct-lab-t3"

-- remove all inputs
local inputs = data.raw["lab"][labMK3].inputs
inputs = removeAllSciencePacksFromInputs(inputs)

-- add them back in the correct order
for scienceIndex,scienceName in pairs{
  sciencePackOrderedNames[1],
  sciencePackOrderedNames[2],
  sciencePackOrderedNames[3],
  sciencePackOrderedNames[4],
  sciencePackOrderedNames[5],
  sciencePackOrderedNames[6],
} do
  table.insert(inputs, scienceIndex, string.format(scienceName, "pack"))
end



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
local labMK4 = "sct-lab-t4"

-- remove all inputs
local inputs = data.raw["lab"][labMK4].inputs
inputs = removeAllSciencePacksFromInputs(inputs)

-- add them back in the correct order
for scienceIndex,scienceName in pairs{
  sciencePackOrderedNames[ 1],
  sciencePackOrderedNames[ 2],
  sciencePackOrderedNames[ 3],
  sciencePackOrderedNames[ 4],
  sciencePackOrderedNames[ 5],
  sciencePackOrderedNames[ 6],
  sciencePackOrderedNames[ 7],
  sciencePackOrderedNames[ 8],
  sciencePackOrderedNames[ 9],
  sciencePackOrderedNames[10],
} do
  table.insert(inputs, scienceIndex, string.format(scienceName, "pack"))
end



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
local labMK5 = "lab-mk2"

-- change power consumption
data.raw["lab"][labMK5].energy_usage = "5MW"
-- change max healt
data.raw["lab"][labMK5].max_health = 350
-- change module slots
data.raw["lab"][labMK5].module_specification = util.table.deepcopy(data.raw["lab"][labMK4].module_specification)
-- quick replacement
data.raw["lab"][labMK5].fast_replaceable_group = data.raw["lab"][labMK1].fast_replaceable_group

LSlib.entity.setLocalisedName("lab", labMK5,
  LSlib.item.getLocalisedName("item", labMK5)
)
LSlib.entity.changeIcons("lab", labMK5, LSlib.item.getIcons("item", labMK5))


--[[
--------------------------------------------------------------------------------
----- Bio lab                                                              -----
--------------------------------------------------------------------------------
if data.raw["lab"]["lab-bio"] and data.raw["tool"]["sct-science-pack-bio"] then
  -- add bio token to the lab
  table.insert(data.raw["lab"]["lab-bio"].inputs, 1, "sct-science-pack-bio")
end
]]
