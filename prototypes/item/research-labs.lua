local scienceNames = require("prototypes/settings").scienceNames
local labMK1 = "lab"

--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
local labMK0 = "lab-mk0"
local labSubgroup = data.raw["item"][labMK0].subgroup

-- burner lab gets flame overlay
local icons = LSlib.item.getIcons("item", labMK1)
icons[2] = {
  icon = "__ScienceCostTweakerM__/graphics/overlays/flame.png",
  icon_size = 32,
  shift = {-32, 32},
  scale = (icons[1].icon_size * (icons[1].scale or 1)) / 32,
}
LSlib.item.changeIcons("item", labMK0, icons)
LSlib.item.setOrderstring("item", labMK0, "d[lab]-a")

if data.raw["item-subgroup"]["sct-labs"] then
  labSubgroup = "sct-labs"
  LSlib.item.setSubgroup("item", labMK0, labSubgroup)
end



--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- change localized name
LSlib.item.setLocalisedName("item", labMK1, {"item-name.lab"})
-- change subgroup
LSlib.item.setSubgroup   ("item", labMK1, labSubgroup)
LSlib.item.setOrderstring("item", labMK1, LSlib.utils.string.split(data.raw["item"][labMK0].order, "-")[1] .. "b")



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
local labMK2 = "sct-lab-t2"
-- change subgroup
LSlib.item.setSubgroup   ("item", labMK2, labSubgroup)
LSlib.item.setOrderstring("item", labMK2, LSlib.utils.string.split(data.raw["item"][labMK0].order, "-")[1] .. "c")



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
local labMK3 = "sct-lab-t3"
-- change subgroup
LSlib.item.setSubgroup   ("item", labMK3, labSubgroup)
LSlib.item.setOrderstring("item", labMK3, LSlib.utils.string.split(data.raw["item"][labMK0].order, "-")[1] .. "d")



--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
local labMK4 = "sct-lab-t4"
-- change subgroup
LSlib.item.setSubgroup   ("item", labMK4, labSubgroup)
LSlib.item.setOrderstring("item", labMK4, LSlib.utils.string.split(data.raw["item"][labMK0].order, "-")[1] .. "e")



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
local labMK5 = "lab-mk2"
-- change subgroup
LSlib.item.setSubgroup   ("item", labMK5, labSubgroup)
LSlib.item.setOrderstring("item", labMK5, LSlib.utils.string.split(data.raw["item"][labMK0].order, "-")[1] .. "f")
-- change overlay
local icons = {
  {
    icon = "__ScienceCostTweakerM__/graphics/sct-lab-t4/icon-128.png",
    icon_size = 128,
    scale = 0.25,
  }
}
for iconIndex, iconLayer in pairs(LSlib.item.getIcons("fluid", string.format(scienceNames.white, "fluid"), 0.5, {8, -8})) do
  icons[iconIndex + 1] = iconLayer
end
LSlib.item.changeIcons("item", labMK5, icons)
LSlib.item.setLocalisedName("item", labMK5, {"item-name.lab-mk2"})



--[[
--------------------------------------------------------------------------------
----- Lab module                                                          -----
--------------------------------------------------------------------------------
if data.raw["item"]["lab-bio"] then
  -- change subgroup
  data.raw["item"]["lab-bio"].subgroup = data.raw["item"]["lab-burner"].subgroup
  data.raw["item"]["lab-bio"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "g"
end



--------------------------------------------------------------------------------
----- Lab module                                                          -----
--------------------------------------------------------------------------------
if data.raw["item"]["lab-module"] then
  -- change subgroup
  data.raw["item"]["lab-module"].subgroup = data.raw["item"]["lab-burner"].subgroup
  data.raw["item"]["lab-module"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "h"
end



--------------------------------------------------------------------------------
----- alien lab                                                          -----
--------------------------------------------------------------------------------
if data.raw["item"]["lab-alien"] then
  -- remove subgroup
  data.raw["item"]["lab-alien"].subgroup = data.raw["item"]["lab-burner"].subgroup
  data.raw["item"]["lab-alien"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "i"
end
]]
