require 'util'
local scienceNames = require("prototypes/settings").scienceNames

-- lab mk 1 (red) --------------------------------------------------------------
--------------------------------------------------------------------------------
local redLabTechName = "sct-lab-t1"
local redLabName     = settings.startup["sct-tier1-lab"].value

-- use the red lab tech for burner and create new tech for the electric one
local redLabTechBis = util.table.deepcopy(data.raw["technology"][redLabTechName])
redLabTechBis.name = redLabTechBis.name .. "-bis"
redLabTechBis.prerequisites = {redLabTechName, "basic-automation"}
data:extend{redLabTechBis}
LSlib.technology.setLocalisedName(redLabTechBis.name, {"technology-name."..redLabTechName})
LSlib.technology.addIngredient   (redLabTechBis.name, 1, string.format(scienceNames.red, "pack"))

LSlib.technology.removeRecipeUnlock("basic-automation", "lab") -- remove the lab since it has its own tech now

-- lab mk 0 (red, burner) ------------------------------------------------------
--------------------------------------------------------------------------------
LSlib.technology.setLocalisedName(redLabTechName, {"item-tier-name.mk0", {"technology-name."..redLabTechName}})
data.raw["technology"][redLabTechName].effects = {}
LSlib.technology.addRecipeUnlock(redLabTechName, "lab-mk0")
LSlib.technology.addRecipeUnlock(redLabTechName, "sct-lab1-construction")
LSlib.technology.addRecipeUnlock(redLabTechName, "sct-lab1-mechanization")

-- change the icons
local icons = LSlib.technology.getIcons(redLabTechName)
icons[2] = {
  icon = "__ScienceCostTweakerM__/graphics/overlays/flame-128.png",
  icon_size = 128,
}
LSlib.technology.changeIcons(redLabTechName, icons)


-- lab mk 2 (green) ------------------------------------------------------------
--------------------------------------------------------------------------------
local greenLabTechName = "sct-lab-t2"
LSlib.technology.addPrerequisite(greenLabTechName, redLabTechBis.name)

-- lab mk 3 (blue) -------------------------------------------------------------
--------------------------------------------------------------------------------
local blueLabTechName = "sct-lab-t3"

LSlib.technology.addIngredient(blueLabTechName, 1, string.format(scienceNames.orange, "pack"))

LSlib.technology.addPrerequisite(blueLabTechName, "flammables")

-- lab mk 4 (yellow) -----------------------------------------------------------
--------------------------------------------------------------------------------
local yellowLabTechName = "sct-lab-t4"

LSlib.technology.addIngredient(yellowLabTechName, 1, string.format(scienceNames.orange, "pack"))
LSlib.technology.addIngredient(yellowLabTechName, 1, string.format(scienceNames.cyan  , "pack"))


-- lab 2 -----------------------------------------------------------------------
--------------------------------------------------------------------------------
local infusedLabTechName = string.format(scienceNames.white, "pack")

if data.raw["technology"]["sct-lab-lab2"] then
  LSlib.technology.addRecipeUnlock   ("sct-lab-lab2", "lab-mk2")
  LSlib.technology.removeRecipeUnlock("sct-lab-lab2", "lab-2"  )
end