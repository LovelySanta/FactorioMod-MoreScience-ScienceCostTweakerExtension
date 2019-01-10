
--require("prototypes.categories.science-group")
--require("prototypes.categories.science-subgroup")



require("prototypes.item.research-lab")
require("prototypes.item.science-intermediates")
require("prototypes.item.regular-science-pack")
require("prototypes.item.alien-science-pack")

require("prototypes.entity.research-lab")

require("prototypes.recipe.research-lab-intermediates")
require("prototypes.recipe.research-lab")
require("prototypes.recipe.science-intermediates")
require("prototypes.recipe.science-fluid")
require("prototypes.recipe.regular-science-pack")

require("prototypes.technology.research-lab")
require("prototypes.technology.regular-science-pack")
require("prototypes.technology.bio-science-pack")
require("prototypes.technology.alien-science-pack")
require("prototypes.technology.module-science-pack")


-- technology tree cleanup
local containsExtension = false
for _,extension in pairs({
  "SeaBlockExtension",
}) do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  log("cleaning up the tech tree")
  MoreScience.lib.technology.removeAllRedundantPrerequisites()
end
