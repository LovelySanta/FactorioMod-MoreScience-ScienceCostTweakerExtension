local scienceNames = require("prototypes/settings").scienceNames

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
  data.raw["recipe"]["fill-"  .. scienceFluid .. "-barrel"].localised_name = {"item-name.filling-barrel" , data.raw["item"][scienceFluid .. "-barrel"].localised_name}
  data.raw["recipe"]["empty-" .. scienceFluid .. "-barrel"].localised_name = {"item-name.emptying-barrel", data.raw["item"][scienceFluid .. "-barrel"].localised_name}
end
