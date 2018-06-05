require "lib/utilities/prototyping"


local function removeSciencePackOrder(sciencePackName)
  if data.raw["tool"][sciencePackName] and data.raw["recipe"][sciencePackName] then
    data.raw["recipe"][sciencePackName].subgroup = nil
    data.raw["recipe"][sciencePackName].order = nil
  else
    log("WARNING: could not remove order from " .. sciencePackName)
  end
end

--------------------------------------------------------------------------------
----- Science pack 1                                                       -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("science-pack-1")
-- Electromagnetic coil require wires instead of plates
editRecipeIngredient("sct-t1-magnet-coils", "copper-plate", "copper-cable", 2)
setRecipeEngergyRequired("science-pack-1", 1)



--------------------------------------------------------------------------------
----- Science pack 2                                                       -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("science-pack-2")

-- add correct recipe ingredients
addRecipeIngredient("science-pack-2", "empty-bottle", 1, "item")
addRecipeIngredient("science-pack-2", "basic-science-fluid-2", 10, "fluid")
setRecipeEngergyRequired("science-pack-2", 2)



--------------------------------------------------------------------------------
----- Science pack 3                                                       -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("science-pack-3")

-- add correct recipe ingredients
addRecipeIngredient("science-pack-3", "empty-bottle", 1, "item")
addRecipeIngredient("science-pack-3", "basic-science-fluid-3", 10, "fluid")
setRecipeEngergyRequired("science-pack-3", 5)




--------------------------------------------------------------------------------
----- Military science pack                                                -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("military-science-pack")

-- add correct recipe ingredients
addRecipeIngredient("military-science-pack", "empty-bottle", 1, "item")
addRecipeIngredient("military-science-pack", "basic-military-science-fluid", 10, "fluid")
setRecipeResultCount("military-science-pack", "military-science-pack", 1)
setRecipeEngergyRequired("military-science-pack", 5)



--------------------------------------------------------------------------------
----- Production science pack                                              -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("production-science-pack")

-- add correct recipe ingredients
addRecipeIngredient("production-science-pack", "empty-bottle", 1, "item")
addRecipeIngredient("production-science-pack", "advanced-science-fluid-1", 10, "fluid")
setRecipeResultCount("production-science-pack", "production-science-pack", 1)
setRecipeEngergyRequired("production-science-pack", 5)


--------------------------------------------------------------------------------
----- High tech science pack                                               -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("high-tech-science-pack")

-- add correct recipe ingredients
addRecipeIngredient("high-tech-science-pack", "empty-bottle", 1, "item")
addRecipeIngredient("high-tech-science-pack", "advanced-science-fluid-2", 10, "fluid")
setRecipeResultCount("high-tech-science-pack", "high-tech-science-pack", 1)
setRecipeEngergyRequired("high-tech-science-pack", 5)



--------------------------------------------------------------------------------
----- Basic automation science pack                                        -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("basic-automation-science-pack")



--------------------------------------------------------------------------------
----- Basic power science pack                                             -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("basic-power-science-pack")



--------------------------------------------------------------------------------
----- Basic logistics science pack                                         -----
--------------------------------------------------------------------------------
-- remove order from recipe as it will take the order from the item
removeSciencePackOrder("basic-logistics-science-pack")
