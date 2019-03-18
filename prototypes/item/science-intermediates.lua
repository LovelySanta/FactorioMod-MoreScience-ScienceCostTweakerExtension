
if not data.raw["item"]["sct-logistic-cargo-unit"] then
  -- logistic pack items
  data:extend ({
    {
      type = "item",
      name = "sct-logistic-cargo-unit",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-cargo-unit.png",
      icon_size = 32,
      subgroup = "sct-science-pack-logistic",
      order = "h_a[logistic]-b[cargo]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-logistic-unimover",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-unimover.png",
      icon_size = 32,
      subgroup = "sct-science-pack-logistic",
      order = "h_a[logistic]-c[unimover]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-logistic-automated-storage",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-automated-storage.png",
      icon_size = 32,
      subgroup = "sct-science-pack-logistic",
      order = "h_a[logistic]-d[storage]",
      stack_size = 200,
    },

    {
      type = "item",
      name = "sct-logistic-memory-unit",
      icon = "__ScienceCostTweakerM__/graphics/bobmods/sct-logistic-memory-unit.png",
      icon_size = 32,
      subgroup = "sct-science-pack-logistic",
      order = "h_a[logistic]-e[memory-unit]",
      stack_size = 200,
    },
  })
end

--[[
if data.raw["tool"]["science-pack-gold"] then
  data.raw["tool"]["science-pack-gold"].icon = "__bobtech__/graphics/icons/alien-technology.png"
  data.raw["tool"]["science-pack-gold"].icon_size = 128
end
]]
