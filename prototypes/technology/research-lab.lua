require 'util'

-- burner lab ------------------------------------------------------------------
--------------------------------------------------------------------------------
-- burner lab accepts potions from first lab
if data.raw["lab"]["lab-burner"] and data.raw["lab"]["lab"] then
  data.raw["lab"]["lab-burner"].inputs = util.table.deepcopy(data.raw["lab"]["lab"].inputs)
end



-- lab mk 1 (red) --------------------------------------------------------------
--------------------------------------------------------------------------------
-- red lab, up to automation science packs
MoreScience.lib.technology.removeRecipeUnlock("basic-automation", "lab")
--MoreScience.lib.technology.addPrerequisite("sct-lab-t1", "basic-automation")
MoreScience.lib.technology.addPrerequisite("sct-lab-t1", "logistics")
MoreScience.lib.technology.addIngredient("sct-lab-t1", 1, "science-pack-1")
MoreScience.lib.technology.removePrerequisite("research-speed-1", "sct-research-t2")

if data.raw["technology"]["sct-lab-t1"].icons and
   data.raw["technology"]["sct-lab-t1"].icons[1] and
   data.raw["technology"]["sct-lab-t1"].icons[1].icon then

  data.raw["technology"]["sct-lab-t1"].icon = data.raw["technology"]["sct-lab-t1"].icons[1].icon

  if data.raw["technology"]["sct-lab-t1"].icons[1].icon_size then
    data.raw["technology"]["sct-lab-t1"].icon_size = data.raw["technology"]["sct-lab-t1"].icons[1].icon_size
  end

  data.raw["technology"]["sct-lab-t1"].icons = nil

end



-- lab mk 2 (green) ------------------------------------------------------------
--------------------------------------------------------------------------------
MoreScience.lib.technology.removePrerequisite("sct-lab-t2", "logistics")
MoreScience.lib.technology.removePrerequisite("sct-lab-t2", "steel-processing")
MoreScience.lib.technology.addPrerequisite("sct-lab-t2", "battery")
MoreScience.lib.technology.addIngredient("sct-lab-t2", 1, "science-pack-2")
MoreScience.lib.technology.addIngredient("sct-lab-t2", 1, "basic-automation-science-pack")

MoreScience.lib.technology.addPrerequisite("research-speed-3", "basic-automation-science-research")

if data.raw["technology"]["sct-lab-t2"].icons and
   data.raw["technology"]["sct-lab-t2"].icons[1] and
   data.raw["technology"]["sct-lab-t2"].icons[1].icon then

  data.raw["technology"]["sct-lab-t2"].icon = data.raw["technology"]["sct-lab-t2"].icons[1].icon

  if data.raw["technology"]["sct-lab-t2"].icons[1].icon_size then
    data.raw["technology"]["sct-lab-t2"].icon_size = data.raw["technology"]["sct-lab-t2"].icons[1].icon_size
  end

  data.raw["technology"]["sct-lab-t2"].icons = nil

end



-- lab mk 3 (blue) ------------------------------------------------------------
--------------------------------------------------------------------------------
MoreScience.lib.technology.addIngredient("sct-lab-t3", 1, "science-pack-3")
MoreScience.lib.technology.addIngredient("sct-lab-t3", 1, "basic-power-science-pack")

if data.raw["technology"]["sct-lab-t3"].icons and
   data.raw["technology"]["sct-lab-t3"].icons[1] and
   data.raw["technology"]["sct-lab-t3"].icons[1].icon then

  data.raw["technology"]["sct-lab-t3"].icon = data.raw["technology"]["sct-lab-t3"].icons[1].icon

  if data.raw["technology"]["sct-lab-t3"].icons[1].icon_size then
    data.raw["technology"]["sct-lab-t3"].icon_size = data.raw["technology"]["sct-lab-t3"].icons[1].icon_size
  end

  data.raw["technology"]["sct-lab-t3"].icons = nil

end



-- lab mk 4 (yellow) -----------------------------------------------------------
--------------------------------------------------------------------------------
MoreScience.lib.technology.addIngredient("sct-lab-t4", 1, "basic-power-science-pack")

if data.raw["technology"]["sct-lab-t4"].icons and
   data.raw["technology"]["sct-lab-t4"].icons[1] and
   data.raw["technology"]["sct-lab-t4"].icons[1].icon then

  data.raw["technology"]["sct-lab-t4"].icon = data.raw["technology"]["sct-lab-t4"].icons[1].icon

  if data.raw["technology"]["sct-lab-t4"].icons[1].icon_size then
    data.raw["technology"]["sct-lab-t4"].icon_size = data.raw["technology"]["sct-lab-t4"].icons[1].icon_size
  end

  data.raw["technology"]["sct-lab-t4"].icons = nil

end



-- lab 2 -----------------------------------------------------------------------
--------------------------------------------------------------------------------
-- disable lab
MoreScience.lib.technology.removeRecipeUnlock("advanced-electronics-3", "lab-2")
MoreScience.lib.technology.disable("sct-lab-lab2")
