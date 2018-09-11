
-- Fix barrel names
for _,scienceFluid in pairs({
  "basic-science-fluid-1",
  "basic-science-fluid-2",
  "basic-science-fluid-3",
  "advanced-science-fluid-1",
  "advanced-science-fluid-2",
  --"extreme-science-fluid",
  "basic-military-science-fluid",
  "basic-automation-science-fluid",
  "basic-power-science-fluid",
  "basic-logistics-science-fluid",
}) do
  data.raw["item"][scienceFluid .. "-barrel"].localised_name = {"item-name.barrel", data.raw["fluid"][scienceFluid].localised_name}
  data.raw["recipe"]["fill-" .. scienceFluid .. "-barrel"].localised_name = {"item-name.filling-barrel", data.raw["item"][scienceFluid .. "-barrel"].localised_name}
  data.raw["recipe"]["empty-" .. scienceFluid .. "-barrel"].localised_name = {"item-name.emptying-barrel", data.raw["item"][scienceFluid .. "-barrel"].localised_name}
end
