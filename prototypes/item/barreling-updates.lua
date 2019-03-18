local scienceNames = require("__MoreScience__/prototypes/settings").scienceNames

-- Fix barrel names
for _,scienceFluid in pairs({
  string.format(scienceNames.red   , "fluid"),
  string.format(scienceNames.green , "fluid"),
  string.format(scienceNames.gray  , "fluid"),
  string.format(scienceNames.orange, "fluid"),
  string.format(scienceNames.cyan  , "fluid"),
  string.format(scienceNames.blue  , "fluid"),
  string.format(scienceNames.purple, "fluid"),
  string.format(scienceNames.yellow, "fluid"),
  string.format(scienceNames.pink  , "fluid"),
  --string.format(scienceNames.white , "fluid"),
}) do
  data.raw["item"][scienceFluid .. "-barrel"].localised_name = {"item-name.barrel", data.raw["fluid"][scienceFluid].localised_name}
end
