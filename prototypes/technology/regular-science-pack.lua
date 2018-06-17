require 'util'

local prerequisitesToRemove = {}

-- red science pack ------------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-research-t1"] then
  -- remove prerequisites on red science research
  --for _,technologyName in pairs({
  --  "optics",
  --  "basic-automation",
  --  "steel-processing",
  --  "military"
  --}) do

  --  MoreScience.lib.technology.removePrerequisite(technologyName, "sct-research-t1")

  --end

  -- enable the red science potion from the start
  for _,effect in pairs (data.raw["technology"]["sct-research-t1"].effects) do
    if effect.type == "unlock-recipe" then
      MoreScience.lib.recipe.enable(effect.recipe)
    end
  end

  -- disable the science potion technology
  data.raw["technology"]["sct-research-t1"].enabled = false
  prerequisitesToRemove["sct-research-t1"] = true
end



-- green science pack ----------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-research-t2"] and data.raw["technology"]["basic-science-research-1"] then
  -- transfer the effects over
  for _,effect in pairs(data.raw["technology"]["sct-research-t2"].effects) do
    if effect.type == "unlock-recipe" then
      MoreScience.lib.technology.addRecipeUnlock("basic-science-research-1", effect.recipe)
    end
  end


  --for _,technologyName in pairs({
  --  "landfill",
  --  "basic-science-research-2",
  --  "basic-automation-science-research",
  --  "electric-energy-distribution-1",
  --  "toolbelt",
  --  "military-2",
  --}) do
    --MoreScience.lib.technology.removePrerequisite(technologyName, "sct-research-t2")
  --end

  -- green science require a new lab
  MoreScience.lib.technology.addPrerequisite("basic-science-research-1", "sct-lab-t1")

  -- disable the research from SCT
  data.raw["technology"]["sct-research-t2"].enabled = false
  prerequisitesToRemove["sct-research-t2"] = true

end



-- bottling science ------------------------------------------------------------
--------------------------------------------------------------------------------



-- gray science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-research-mil"] and data.raw["technology"]["basic-military-science-research"] then
  -- transfer the effects over
  for _,effect in pairs(data.raw["technology"]["sct-research-mil"].effects) do
    if effect.type == "unlock-recipe" then
      MoreScience.lib.technology.addRecipeUnlock("basic-military-science-research", effect.recipe)
    end
  end

  -- add additional prerequisites
  MoreScience.lib.technology.addPrerequisite("basic-military-science-research", "advanced-electronics")
  MoreScience.lib.technology.addPrerequisite("energy-shield-equipment", "basic-military-science-research")

  -- disable the research from SCT
  data.raw["technology"]["sct-research-mil"].enabled = false
  prerequisitesToRemove["sct-research-mil"] = true
end



-- orange science pack ---------------------------------------------------------
--------------------------------------------------------------------------------



-- blue science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-research-t3"] and data.raw["technology"]["basic-science-research-2"] then
  -- transfer the effects over
  for _,effect in pairs(data.raw["technology"]["sct-research-t3"].effects) do
    if effect.type == "unlock-recipe" then
      MoreScience.lib.technology.addRecipeUnlock("basic-science-research-2", effect.recipe)
    end
  end

  -- also needs some effects from the t3 lab research
  for _,effect in pairs(util.table.deepcopy(data.raw["technology"]["sct-lab-t3"].effects)) do
    if effect.type == "unlock-recipe"
    and (effect.recipe ~= "sct-lab-t3" and effect.recipe ~= "sct-lab3-construction" and effect.recipe ~= "sct-lab3-optics") then
      MoreScience.lib.technology.removeRecipeUnlock("sct-lab-t3", effect.recipe)
      MoreScience.lib.technology.addRecipeUnlock("basic-science-research-2", effect.recipe)
    end
  end

  -- add additional prerequisites
  MoreScience.lib.technology.addPrerequisite("basic-science-research-2", "sct-lab-t2")
  MoreScience.lib.technology.addPrerequisite("basic-power-science-research", "sct-lab-t2")
  MoreScience.lib.technology.addPrerequisite("sct-lab-t3", "basic-science-research-2")
  MoreScience.lib.technology.addPrerequisite("energy-shield-equipment", "basic-power-science-research")
  MoreScience.lib.technology.addPrerequisite("laser-turrets", "basic-power-science-research")

  -- disable the research from SCT
  data.raw["technology"]["sct-research-t3"].enabled = false
  prerequisitesToRemove["sct-research-t3"] = true
end



-- light blue science pack -----------------------------------------------------
--------------------------------------------------------------------------------



-- purple science pack ---------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-research-prod"] and data.raw["technology"]["advanced-science-research-1"] then

  -- transfer the effects over
  for _,effect in pairs(data.raw["technology"]["sct-research-prod"].effects) do
    if effect.type == "unlock-recipe" then
      MoreScience.lib.technology.addRecipeUnlock("advanced-science-research-1", effect.recipe)
    end
  end

  -- add additional prerequisites
  MoreScience.lib.technology.addPrerequisite("advanced-science-research-1", "sct-lab-t3")
  MoreScience.lib.technology.addPrerequisite("basic-logistics-science-research", "sct-lab-t3")

  -- disable the research from SCT
  data.raw["technology"]["sct-research-prod"].enabled = false
  prerequisitesToRemove["sct-research-prod"] = true
end



-- pink science pack -----------------------------------------------------------
--------------------------------------------------------------------------------
if not data.raw["technology"]["sct-research-logistic"] then
  for _,recipeName in pairs({
    "sct-logistic-cargo-unit",
    "sct-logistic-memory-unit",
    "sct-logistic-unimover",
    "sct-logistic-automated-storage",
  }) do
    MoreScience.lib.technology.addRecipeUnlock("basic-logistics-science-research", recipeName)
  end
else
  -- transfer the effects over
  for _,effect in pairs(data.raw["technology"]["sct-research-logistic"].effects) do
    if effect.type == "unlock-recipe" and effect.recipe ~= "logistic-science-pack" then
      MoreScience.lib.technology.addRecipeUnlock("basic-logistics-science-research", effect.recipe)
    end
  end

  -- disable the research from SCT
  data.raw["technology"]["sct-research-logistic"].enabled = false
  prerequisitesToRemove["sct-research-logistic"] = true
end

-- add prerequisites
MoreScience.lib.technology.addPrerequisite("basic-logistics-science-research", "circuit-network")
if data.raw["technology"]["zinc-processing"] then
    MoreScience.lib.technology.addPrerequisite("basic-logistics-science-research", "zinc-processing")
end



-- high tech science pack ------------------------------------------------------
--------------------------------------------------------------------------------
if data.raw["technology"]["sct-research-ht"] and data.raw["technology"]["advanced-science-research-2"] then
  -- transfer the effects over
  for _,effect in pairs(data.raw["technology"]["sct-research-ht"].effects) do
    if effect.type == "unlock-recipe" then
      MoreScience.lib.technology.addRecipeUnlock("advanced-science-research-2", effect.recipe)
    end
  end

  -- add additional prerequisites
  MoreScience.lib.technology.addPrerequisite("advanced-science-research-2", "sct-lab-t4")
  MoreScience.lib.technology.addPrerequisite("sct-lab-t4", "sct-lab-t3")

  -- disable the research from SCT
  data.raw["technology"]["sct-research-ht"].enabled = false
  prerequisitesToRemove["sct-research-ht"] = true

end



-- infinite science research ---------------------------------------------------
--------------------------------------------------------------------------------







-- remove all prerequisites that we disabled the technology from
for technologyName,technology in pairs(data.raw["technology"]) do
  if technology.prerequisites then
    for _,prerequisite in pairs(util.table.deepcopy(technology.prerequisites)) do
      if prerequisitesToRemove[prerequisite] then
        MoreScience.lib.technology.removePrerequisite(technologyName, prerequisite)
      end
    end
  end
end
