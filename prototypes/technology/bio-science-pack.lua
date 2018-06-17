
-- bio science pack ------------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["tool"]["sct-science-pack-bio"] then

  -- move lab over
  MoreScience.lib.technology.removeRecipeUnlock("bio-aboretum-1", "lab-bio")
  MoreScience.lib.technology.addRecipeUnlock("sct-research-bio", "lab-bio")

  -- bio lab depend on burner lab, not t2
  MoreScience.lib.technology.removePrerequisite("sct-research-bio", "sct-lab-t2")

  -- remove prerequisite of aboretum since pack has own unlock
  MoreScience.lib.technology.removePrerequisite("bio-desert-farming", "bio-aboretum-1")
  MoreScience.lib.technology.removePrerequisite("bio-temperate-farming", "bio-aboretum-1")
  MoreScience.lib.technology.removePrerequisite("bio-swamp-farming", "bio-aboretum-1")

end
