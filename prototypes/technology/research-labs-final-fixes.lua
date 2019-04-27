local scienceNames = require("prototypes/settings").scienceNames

-- lab 2 -----------------------------------------------------------------------
--------------------------------------------------------------------------------
local whiteSciencePackTech = string.format(scienceNames.white, "pack")

if data.raw["technology"]["sct-lab-lab2"] then
  LSlib.technology.removeRecipeUnlock(whiteSciencePackTech, "lab-mk2")
else
  LSlib.technology.addRecipeUnlock(whiteSciencePackTech, "lab-mk2")
end
