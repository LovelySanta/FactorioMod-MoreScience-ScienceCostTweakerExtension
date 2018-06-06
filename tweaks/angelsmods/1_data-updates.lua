require "lib/utilities/prototyping"
require "lib/utilities/util"



--------------------------------------------------------------------------------
----- Angels Refining                                                      -----
--------------------------------------------------------------------------------
if mods["angelsrefining"] then

  -- move sand over to solid-sand
  if data.raw["item"]["solid-sand"] and data.raw["item"]["sand"] then
    -- delete sand
    removeRecipeUnlock("bottling-research", "sand")
    data.raw["recipe"]["sand"] = nil
    data.raw["item"]["sand"] = nil

    -- use solid-sand instead
    editRecipeIngredient("glass", "sand", "solid-sand", 1)
    --removeRecipeIngredient("glass", "sand")
    --addRecipeIngredient("glass", "solid-sand", 2)
    addPrerequisiteTechnology("bottling-research", "water-washing-1")
    editRecipeIngredient("tree-seed-creator", "sand", "solid-sand", 1)
    editRecipeIngredient("wood-plantation", "sand", "solid-sand", 1)

    --removeRecipeIngredient("tree-seed-creator", "sand")
    for index,result in pairs(data.raw["recipe"]["tree-seed-creator"].results) do
      if result.name == "sand" then
        data.raw["recipe"]["tree-seed-creator"].results[index].name = "solid-sand"
        --addRecipeIngredient("tree-seed-creator", "solid-sand", 2 * result.amount)
        break
      end
    end


    -- adapt purified water recipe
    if data.raw["recipe"]["purified-water"] then
      for index, recipe in pairs(data.raw["recipe"]["purified-water"].results) do
        if recipe.name == "sand" then
          data.raw["recipe"]["purified-water"].results[index].name = "solid-sand"
          break
        end
      end
    end

  -- change sand recipe from stone to crushed stone if there is no solid-sand
  elseif data.raw["item"]["stone-crushed"] and data.raw["item"]["sand"] and data.raw["recipe"]["sand"] then
    removeRecipeIngredient("sand", "stone")
    addRecipeIngredient("sand", "stone-crushed", 12)
    addPrerequisiteTechnology("bottling-research", "ore-crushing")

    if data.raw["recipe"]["slag-processing-stone"] then -- change crafting if crushers exists
      data.raw["recipe"]["sand"].category = data.raw["recipe"]["slag-processing-stone"].category
      data.raw["recipe"]["sand"].subgroup = data.raw["recipe"]["slag-processing-stone"].subgroup
      data.raw["recipe"]["sand"].order = stringSplit(data.raw["recipe"]["slag-processing-stone"].order, "[")[1] .. "[stone-processing-sand]"
    end
  end

  -- move from purified-water to water-purified
  if data.raw["fluid"]["water-purified"] and data.raw["fluid"]["purified-water"] then
    -- delete purified water
    data.raw["fluid"]["purified-water"] = nil
    data.raw["recipe"]["purified-water"] = nil
    data.raw["item"]["purified-water-barrel"] = nil
    data.raw["recipe"]["fill-purified-water-barrel"] = nil
    data.raw["recipe"]["empty-purified-water-barrel"] = nil
    removeRecipeUnlock("fluid-handling-3", "fill-purified-water-barrel")
    removeRecipeUnlock("fluid-handling-3", "empty-purified-water-barrel")

    removeRecipeUnlock("basic-science-research-1", "purified-water")
    addPrerequisiteTechnology("basic-science-research-1", "water-treatment")
    removePrerequisiteTechnology("basic-science-research-1", "steel-processing")
    addPrerequisiteTechnology("water-treatment", "steel-processing")

    -- adapt science fluids
    for _, scienceRecipeName in pairs({
      --"basic-science-fluid-1",
      "basic-science-fluid-2",
      "basic-science-fluid-3",
      "advanced-science-fluid-1",
      "advanced-science-fluid-2",
      --"extreme-science-fluid",
      "basic-military-science-fluid",
      "basic-automation-science-fluid",
      "basic-power-science-fluid",
      "basic-logistics-science-fluid",
    }) do
      if data.raw["recipe"][scienceRecipeName] then
        for index, ingredient in pairs(data.raw["recipe"][scienceRecipeName].ingredients) do
          if ingredient.name == "purified-water" then
            data.raw["recipe"][scienceRecipeName].ingredients[index].name = "water-purified"
          end
        end
      end
    end
  end
end



--------------------------------------------------------------------------------
----- Angels Smelting                                                      -----
--------------------------------------------------------------------------------
if mods["angelssmelting"] then
  -- move glass item over to angels glass
  data.raw["recipe"]["glass"].result = "angels-plate-glass"
  removeRecipeIngredient("empty-bottle", "glass")
  addRecipeIngredient("empty-bottle", "angels-plate-glass", 3)
  if data.raw["recipe"]["glass-mixture-1"] then
    data.raw["recipe"]["glass"].order = data.raw["recipe"]["glass-mixture-1"].order .. "1"
    data.raw["recipe"]["glass-mixture-1"].order = data.raw["recipe"]["glass-mixture-1"].order .. "2"
    data.raw["recipe"]["glass"].subgroup = data.raw["recipe"]["glass-mixture-1"].subgroup
  end
end

if mods["angelsbioprocessing"] then
  -- remove wood production from moreScience
  for _,effect in pairs(data.raw["technology"]["wood-plantation"].effects) do
    if effect.type == "unlock-recipe" and effect.recipe then
      removeRecipeUnlock("wood-plantation", effect.recipe)
    end
  end
  data.raw["technology"]["wood-plantation"] = nil
end



--------------------------------------------------------------------------------
----- Angels Petrochem                                                      -----
--------------------------------------------------------------------------------
if mods["angelspetrochem"] then
  -- add lab numbering from angels petrochem
  for labNumber, labName in pairs({
    --[1] = "lab-burner",
    [1] = "lab",
    [2] = "sct-lab-2",
    [3] = "sct-lab-3",
    [4] = "sct-lab-4",
    [5] = "lab-mk2",
  }) do
    if data.raw["item"][labName] then
      data.raw["item"][labName].icon = nil
      data.raw["item"][labName].icon_size = nil
      data.raw["item"][labName].icons = {
        {
          icon = data.raw["item"]["lab-burner"].icon,
          icon_size = data.raw["item"]["lab-burner"].icon_size,
        },
        {
          icon = "__angelspetrochem__/graphics/icons/num_" .. math.min(labNumber, 5) .. ".png",
          icon_size = 32,
          tint = {r = 0.2, g = 1, b = 0.2, a = 0},
          scale = .32,
          shift = {-12, -12},
        }
      }
      if labNumber > 5 then
        table.insert(data.raw["item"][labName].icons, {
            icon = "__angelspetrochem__/graphics/icons/num_" .. math.min(labNumber - 5, 5) .. ".png",
            icon_size = 32,
            tint = {r = 0.2, g = 1, b = 0.2, a = 0},
            scale = .32,
            shift = {-4, -12},
        })
      end
    end
  end

  data.raw["item"]["lab-burner"].icon = nil
  data.raw["item"]["lab-burner"].icon_size = nil
  data.raw["item"]["lab-burner"].icons = deepcopy(data.raw["item"]["lab"].icons)

  -- replace chemical plant with angels chemical plants
  if data.raw["recipe"]["angels-chemical-plant"] then
    removeRecipeUnlock("basic-science-research-1", "chemical-plant")
    removePrerequisiteTechnology("basic-science-research-1", "steel-processing")
    addPrerequisiteTechnology("basic-science-research-1", "basic-chemistry-2")
    addPrerequisiteTechnology("basic-chemistry-2", "steel-processing")

    -- add new recipe category to only use the regular chemical plants
    data:extend({
      {
        type = "recipe-category",
        name = "basic-chemistry",
      },
    })
    for _, buildingName in pairs({
      "angels-chemical-plant",
      "angels-chemical-plant-2",
      "angels-chemical-plant-3",
      "angels-chemical-plant-4",
    }) do
      table.insert(data.raw["assembling-machine"][buildingName].crafting_categories, "basic-chemistry")
    end

    -- adapt science fluids: only craftable in regular chemical plants
    for _, scienceRecipeName in pairs({
      "basic-science-fluid-1",
      "basic-science-fluid-2",
      "basic-science-fluid-3",
      "advanced-science-fluid-1",
      "advanced-science-fluid-2",
      "extreme-science-fluid",
      "basic-military-science-fluid",
      "basic-automation-science-fluid",
      "basic-power-science-fluid",
      "basic-logistics-science-fluid",
    }) do
      data.raw["recipe"][scienceRecipeName].category = "basic-chemistry"
    end

    -- adapt infused science packs: only craftable in advanced chemical plants
    for _, scienceRecipeName in pairs({
      "infused-basic-science-pack-1",
      "infused-basic-science-pack-2",
      "infused-basic-science-pack-3",
      "infused-advanced-science-pack-1",
      "infused-advanced-science-pack-2",
      "infused-extreme-science-pack",
      "infused-basic-military-science-pack",
      "infused-basic-automation-science-pack",
      "infused-basic-power-science-pack",
      "infused-basic-logistics-science-pack",
    }) do
      data.raw["recipe"][scienceRecipeName].category = "advanced-chemistry"
    end
  end

  -- bottling requires wood production
  addPrerequisiteTechnology("bottling-research", "bio-aboretum-1")

  -- change rocket fuel research
  if data.raw["technology"]["angels-rocket-fuel"] then
    removeRecipeUnlock("rocket", "rocket-fuel")
    addPrerequisiteTechnology("rocketpart-fusion-reactor", "angels-rocket-fuel")
    addPrerequisiteTechnology("rocketpart-ion-thruster", "angels-rocket-fuel")
    removePrerequisiteTechnology("rocket-silo", "angels-rocket-fuel")

    data.raw["technology"]["angels-rocket-fuel"].icon = data.raw["technology"]["rocket"].icon
    data.raw["technology"]["angels-rocket-fuel"].icon_size = data.raw["technology"]["rocket"].icon_size
  end
end
