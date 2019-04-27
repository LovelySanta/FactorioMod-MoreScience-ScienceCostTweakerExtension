
LSlib.item.setSubgroup("item", "lab", data.raw["item"]["lab-mk0"].subgroup)
LSlib.item.setOrderstring("item", "lab", LSlib.utils.string.split(data.raw["item"]["lab-mk0"].order, "-")[1] .. "b")
