local scienceNames = require("prototypes/settings").scienceNames

-- lab 2 -----------------------------------------------------------------------
--------------------------------------------------------------------------------
local whiteSciencePackTech = string.format(scienceNames.white, "pack")

LSlib.technology.addRecipeUnlock(whiteSciencePackTech, "lab-mk2")
