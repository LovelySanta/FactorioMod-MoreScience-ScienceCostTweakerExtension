local scienceNames = require("prototypes/settings").scienceNames

-- module science pack ---------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-lab-modules"] then

  -- add prerequisites
  LSlib.technology.addIngredient("sct-lab-modules", 1, string.format(scienceNames.orange, "pack"))
  LSlib.technology.addPrerequisite("sct-lab-modules", "sct-lab-t2")

end
