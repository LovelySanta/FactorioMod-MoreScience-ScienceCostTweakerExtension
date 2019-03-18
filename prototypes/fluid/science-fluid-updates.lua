local scienceNames = require("__MoreScience__/prototypes/settings").scienceNames


--------------------------------------------------------------------------------
----- Basic science fluid 1                                                -----
--------------------------------------------------------------------------------
for color,scienceName in pairs(scienceNames) do
  LSlib.item.setLocalisedName("fluid", string.format(scienceName, "fluid"),
    {"fluid-name.science-fluid",
      {[1] = "item-name."..string.format(scienceName, "pack")}
    }
  )
end
