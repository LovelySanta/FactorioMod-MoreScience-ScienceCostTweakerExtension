
-- move science pack subgroup back in place
data.raw["item-subgroup"]["science-pack"].group = "ms-science"
data.raw["item-subgroup"]["science-pack"].order = stringSplit(data.raw["item-subgroup"]["infused-science-pack"].order, "-")[1] .. "-c-a"
