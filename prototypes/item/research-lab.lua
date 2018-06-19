
--------------------------------------------------------------------------------
----- Burner lab                                                           -----
--------------------------------------------------------------------------------
-- burner lab gets same icon as regular lab
data.raw["item"]["lab-burner"].icon = data.raw["item"]["lab"].icons[1].icon
data.raw["item"]["lab-burner"].icon_size = data.raw["item"]["lab"].icon_size
data.raw["item"]["lab-burner"].order = "d[lab]-a"
if data.raw["item-subgroup"]["sct-labs"] then
  data.raw["item-subgroup"]["sct-labs"].group = "ms-science"
  data.raw["item"]["lab-burner"].subgroup = "sct-labs"
end


--------------------------------------------------------------------------------
----- Lab MK1                                                              -----
--------------------------------------------------------------------------------
-- change localized name
data.raw["item"]["lab"].localised_name = data.raw["lab"]["lab"].localised_name
-- change subgroup
data.raw["item"]["lab"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["lab"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "b"
-- change icon
data.raw["item"]["lab"].icon = data.raw["item"]["lab"].icons[1].icon
--data.raw["item"]["lab"].icon_size = data.raw["item"]["lab"].icons[1].icon_size
data.raw["item"]["lab"].icons = nil



--------------------------------------------------------------------------------
----- Lab MK2                                                              -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["sct-lab-t2"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-t2"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "c"
-- change icon
data.raw["item"]["sct-lab-t2"].icon = data.raw["item"]["sct-lab-t2"].icons[1].icon
--data.raw["item"]["sct-lab-t2"].icon_size = data.raw["item"]["sct-lab-t2"].icons[1].icon_size
data.raw["item"]["sct-lab-t2"].icons = nil



--------------------------------------------------------------------------------
----- Lab MK3                                                              -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["sct-lab-t3"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-t3"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "d"
-- change icon
data.raw["item"]["sct-lab-t3"].icon = data.raw["item"]["sct-lab-t3"].icons[1].icon
--data.raw["item"]["sct-lab-t3"].icon_size = data.raw["item"]["sct-lab-t3"].icons[1].icon_size
data.raw["item"]["sct-lab-t3"].icons = nil


--------------------------------------------------------------------------------
----- Lab MK4                                                              -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["sct-lab-t4"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["sct-lab-t4"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "e"
-- change icon
data.raw["item"]["sct-lab-t4"].icon = data.raw["item"]["sct-lab-t4"].icons[1].icon
--data.raw["item"]["sct-lab-t4"].icon_size = data.raw["item"]["sct-lab-t4"].icons[1].icon_size
data.raw["item"]["sct-lab-t4"].icons = nil



--------------------------------------------------------------------------------
----- Infused lab                                                          -----
--------------------------------------------------------------------------------
-- change subgroup
data.raw["item"]["lab-mk2"].subgroup = data.raw["item"]["lab-burner"].subgroup
data.raw["item"]["lab-mk2"].order = MoreScience.lib.util.stringSplit(data.raw["item"]["lab-burner"].order, "-")[1] .. "f"



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
