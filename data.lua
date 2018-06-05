
-- categories
categoryPath = "prototypes/categories/"
require(categoryPath .. "science-group")
require(categoryPath .. "science-subgroup")

-- entities
entityPath = "prototypes/entity/"
require(entityPath .. "research-lab")

-- fluids
fluidPath = "prototypes/fluid/"
require(fluidPath .. "science-fluid")

-- items
itemPath = "prototypes/item/"
require(itemPath .. "regular-science-pack")
require(itemPath .. "research-lab")

-- recipes
recipePath = "prototypes/recipe/"
require(recipePath .. "science-intermediates")
require(recipePath .. "science-fluid")
require(recipePath .. "regular-science-pack")
require(recipePath .. "research-lab")

-- technology
technologyPath = "prototypes/technology/"
require(technologyPath .. "regular-science-research")
require(technologyPath .. "science-intermediates")
require(technologyPath .. "research-lab")
