
-- remove order from recipe as it will take the order from the item
local function removeSciencePackOrder(sciencePackName)
  if data.raw["tool"][sciencePackName] and data.raw["recipe"][sciencePackName] then
    data.raw["recipe"][sciencePackName].subgroup = nil
    data.raw["recipe"][sciencePackName].order = nil
  else
    log("WARNING: could not remove order from " .. sciencePackName)
  end
end

removeSciencePackOrder("science-pack-1")
removeSciencePackOrder("science-pack-2")
removeSciencePackOrder("science-pack-3")
removeSciencePackOrder("military-science-pack")
removeSciencePackOrder("production-science-pack")
removeSciencePackOrder("high-tech-science-pack")

removeSciencePackOrder("basic-automation-science-pack")
removeSciencePackOrder("basic-power-science-pack")
removeSciencePackOrder("basic-logistics-science-pack")
