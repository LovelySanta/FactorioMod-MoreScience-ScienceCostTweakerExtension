
--------------------------------------------------------------------------------
----- Science pack 1                                                       -----
--------------------------------------------------------------------------------
-- change coils require cables instead of plates
MoreScience.lib.recipe.editIngredient("sct-t1-magnet-coils", "copper-plate", "copper-cable", 2)



--------------------------------------------------------------------------------
----- Basic logistics science pack                                         -----
--------------------------------------------------------------------------------
if not data.raw["recipe"]["sct-logistic-cargo-unit"] then
  -- logistic intermediate recipes
  data:extend ({
    {
      type = "recipe",
      name = "sct-logistic-cargo-unit",
      --subgroup = "sct-science-pack-logistic",
      --order = "h_a[logistic]-b[cargo]",
      expensive =
      {
        enabled = false,
        energy_required = 7.5,
        ingredients =
        {
          {"sct-logistic-unimover", 2},
          {"sct-logistic-automated-storage", 3},
        },
        results =
        {
          {type="item", name="sct-logistic-cargo-unit", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 3,
        ingredients =
        {
          {"sct-logistic-unimover", 1},
          {"sct-logistic-automated-storage", 1},
        },
        results =
        {
          {type="item", name="sct-logistic-cargo-unit", amount=1},
        },
      },
    },

    {
      type = "recipe",
      name = "sct-logistic-unimover",
      --subgroup = "sct-science-pack-logistic",
      --order = "h_a[logistic]-c[unimover]",
      expensive =
      {
        enabled = false,
        energy_required = 5,
        ingredients =
        {
          {"flying-robot-frame", 2},
          {"express-transport-belt", 5},
        },
        results =
        {
          {type="item", name="sct-logistic-unimover", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 2,
        ingredients =
        {
          {"flying-robot-frame", 1},
          {"express-transport-belt", 2},
        },
        results =
        {
          {type="item", name="sct-logistic-unimover", amount=1},
        },
      },
    },

    {
      type = "recipe",
      name = "sct-logistic-automated-storage",
      --subgroup = "sct-science-pack-logistic",
      --order = "h_a[logistic]-d[storage]",
      expensive =
      {
        enabled = false,
        energy_required = 5,
        ingredients =
        {
          {"filter-inserter", 2},
          {"steel-chest", 5},
        },
        results =
        {
          {type="item", name="sct-logistic-automated-storage", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 2,
        ingredients =
        {
          {"filter-inserter", 1},
          {"steel-chest", 2},
        },
        results =
        {
          {type="item", name="sct-logistic-automated-storage", amount=1},
        },
      },
    },

    {
      type = "recipe",
      name = "sct-logistic-memory-unit",
      --subgroup = "sct-science-pack-logistic",
      --order = "h_a[logistic]-e[memory-unit]",
      expensive =
      {
        enabled = false,
        energy_required = 5,
        ingredients =
        {
          {"arithmetic-combinator", 2},
          {"constant-combinator", 5},
        },
        results =
        {
          {type="item", name="sct-logistic-memory-unit", amount=1},
        },
      },
      normal =
      {
        enabled = false,
        energy_required = 2,
        ingredients =
        {
          {"arithmetic-combinator", 1},
          {"constant-combinator", 2},
        },
        results =
        {
          {type="item", name="sct-logistic-memory-unit", amount=1},
        },
      },
    },
  })
end

MoreScience.lib.recipe.editIngredient("sct-logistic-memory-unit", "constant-combinator", "decider-combinator", 1)
MoreScience.lib.recipe.editIngredient("sct-logistic-unimover", "flying-robot-frame", "electric-engine-unit", 1)
MoreScience.lib.recipe.editIngredient("sct-logistic-unimover", "express-transport-belt", "sct-t3-atomic-sensors", 1)
