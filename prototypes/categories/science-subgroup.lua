
-- move science pack subgroup back in place
data.raw["item-subgroup"]["science-pack"].group = "ms-science"
data.raw["item-subgroup"]["science-pack"].order = MoreScience.lib.util.stringSplit(data.raw["item-subgroup"]["infused-science-pack"].order, "-")[1] .. "-c-a"

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
