
require("prototypes.item.science-packs-final-fixes")
require("prototypes.item.research-labs-final-fixes")
require("prototypes.item.alien-science-pack-final-fixes")

require("prototypes.entity.research-labs-final-fixes")

require("prototypes.recipe.science-packs-final-fixes")
require("prototypes.recipe.science-fluids-final-fixes")

require("prototypes.technology.science-packs-final-fixes")
--require("prototypes.technology.bio-science-pack")
require("prototypes.technology.research-labs-final-fixes")
require("prototypes.technology.alien-science-pack-final-fixes")
require("prototypes.technology.module-science-pack-final-fixes")



-- technology tree cleanup
local containsExtension = false
for _,extension in pairs{
  -- when modules present, we don't remove redundant prerequisites here
  --"BobAngelsExtension"
} do
  if mods["MoreScience-" .. extension] then
    containsExtension = true
    break
  end
end
if not containsExtension then
  log("cleaning up the tech tree")
  LSlib.technology.removeAllRedundantPrerequisites()
end
