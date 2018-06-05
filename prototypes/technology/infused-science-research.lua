

-- change research cost
data.raw["technology"]["infinite-science-research"].unit.count = data.raw["technology"]["infused-basic-science-research-1"].unit.count

data.raw["technology"]["infused-basic-science-research-2"].unit.count = 2 * data.raw["technology"]["infused-basic-science-research-1"].unit.count

data.raw["technology"]["infused-basic-military-science-research"].unit.count = 2 * data.raw["technology"]["infused-basic-science-research-2"].unit.count
data.raw["technology"]["infused-basic-automation-science-research"].unit.count = data.raw["technology"]["infused-basic-military-science-research"].unit.count

data.raw["technology"]["infused-basic-science-research-3"].unit.count = 2 * data.raw["technology"]["infused-basic-science-research-2"].unit.count
data.raw["technology"]["infused-basic-power-science-research"].unit.count = data.raw["technology"]["infused-basic-science-research-3"].unit.count

data.raw["technology"]["infused-advanced-science-research-1"].unit.count = 2 * data.raw["technology"]["infused-basic-science-research-3"].unit.count
data.raw["technology"]["infused-advanced-science-research-2"].unit.count = data.raw["technology"]["infused-advanced-science-research-1"].unit.count
data.raw["technology"]["infused-basic-logistics-science-research"].unit.count = data.raw["technology"]["infused-advanced-science-research-1"].unit.count
