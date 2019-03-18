require("__MoreScience__/LSlib/lib")
local scienceNames = require("prototypes/settings").scienceNames

-- move science pack subgroup back in place
data.raw["item-subgroup"]["science-pack"].group = "ms-science"
data.raw["item-subgroup"]["science-pack"].order = LSlib.utils.string.split(data.raw["item-subgroup"]["ms-science-infused-science-pack"].order, "-")[1] .. "-c[science-pack]-a"

if not data.raw["item-subgroup"]["sct-science-pack-logistic"] then
  -- science groups
  data:extend ({
    {
      type = "item-subgroup",
      name = "sct-science-pack-logistic",
      group = "sct-science",
      order = "h_a[logistic]",
    },
  })
end

if data.raw["item-subgroup"]["sct-labs"] then
  data.raw["item-subgroup"]["sct-labs"].group = "ms-science"
end
