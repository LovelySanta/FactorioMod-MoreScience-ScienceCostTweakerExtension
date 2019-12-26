local scienceNames = require("prototypes/settings").scienceNames
local function removeSciencePackFromInputs(scienceName, inputs)
    for inputIndex,input in pairs(inputs or {}) do
      if input == string.format(scienceName, "pack") then
        table.remove(inputs, inputIndex)
        return
      end
    end
  end



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
local labMK1 = "lab"
local inputs = data.raw["lab"][labMK1].inputs
removeSciencePackFromInputs(string.format(scienceNames.pink, "pack"), inputs)



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = "sct-lab-t2"
local inputs = data.raw["lab"][labMK2].inputs
removeSciencePackFromInputs("sct-bio-science-pack", inputs)



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
local labMK3 = "sct-lab-t3"
local inputs = data.raw["lab"][labMK3].inputs
removeSciencePackFromInputs("sct-bio-science-pack", inputs)



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
local labMK4 = "sct-lab-t4"
local inputs = data.raw["lab"][labMK4].inputs
removeSciencePackFromInputs("sct-bio-science-pack", inputs)

hasWhiteScience = false
for _,packName in pairs(inputs) do
  if packName == string.format(scienceNames.white, "pack") then
    hasWhiteScience = true
  end
end
if not hasWhiteScience then
  table.insert(inputs, string.format(scienceNames.white, "pack"))
end