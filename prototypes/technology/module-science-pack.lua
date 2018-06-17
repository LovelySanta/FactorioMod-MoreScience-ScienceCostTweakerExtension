
-- module science pack ---------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-lab-modules"] then

  -- add prerequisites
  MoreScience.lib.technology.addIngredient("sct-lab-modules", 1, "basic-automation-science-pack")
  MoreScience.lib.technology.addPrerequisite("sct-lab-modules", "sct-lab-t2")

end
