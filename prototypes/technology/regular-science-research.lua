require "lib/utilities/prototyping"



-- remove duplicate science-pack-2
removeRecipeUnlock("automation-2", "science-pack-2")
-- basic-science-pack-3 depends on solar panels (becose of the labs)
addPrerequisiteTechnology("basic-science-research-2", "solar-energy")
-- military-science-pack depend on advanced circuits (potion ingredient)
addPrerequisiteTechnology("basic-military-science-research", "advanced-electronics")
-- high-tech-science-pack depend on nuclear reactor (lab require centrifuge)
addPrerequisiteTechnology("advanced-science-research-2", "nuclear-power")

-- change localised naming
data.raw["technology"]["basic-science-research-1"].localised_name = {"technology-name.research", {"item-name.science-pack-2"}}
data.raw["technology"]["basic-science-research-2"].localised_name = {"technology-name.research", {"item-name.science-pack-3"}}
data.raw["technology"]["advanced-science-research-1"].localised_name = {"technology-name.research", {"item-name.production-science-pack"}}
data.raw["technology"]["advanced-science-research-2"].localised_name = {"technology-name.research", {"item-name.high-tech-science-pack"}}
data.raw["technology"]["basic-military-science-research"].localised_name = {"technology-name.research", {"item-name.military-science-pack"}}
data.raw["technology"]["basic-automation-science-research"].localised_name = {"technology-name.research", {"item-name.basic-automation-science-pack"}}
data.raw["technology"]["basic-power-science-research"].localised_name = {"technology-name.research", {"item-name.basic-power-science-pack"}}
data.raw["technology"]["basic-logistics-science-research"].localised_name = {"technology-name.research", {"item-name.basic-logistics-science-pack"}}

-- change research cost
data.raw["technology"]["basic-science-research-1"].unit.count = data.raw["technology"]["automation-2"].unit.count
data.raw["technology"]["bottling-research"].unit.count = 2 * data.raw["technology"]["basic-science-research-1"].unit.count
data.raw["technology"]["basic-military-science-research"].unit.count = data.raw["technology"]["advanced-electronics"].unit.count
data.raw["technology"]["advanced-science-research-1"].unit.count = data.raw["technology"]["solar-energy"].unit.count
data.raw["technology"]["advanced-science-research-2"].unit.count = data.raw["technology"]["advanced-science-research-1"].unit.count
