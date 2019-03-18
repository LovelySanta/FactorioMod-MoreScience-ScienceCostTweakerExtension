local scienceNames = require("__MoreScience__/prototypes/settings").scienceNames

-- move regular science packs back to the science subgroup where they belong
for _,scienceName in pairs(scienceNames) do
  LSlib.item.setSubgroup   ("tool", string.format(scienceName, "pack"), "science-pack")
  LSlib.item.setOrderstring("tool", string.format(scienceName, "pack"),
    "z-MoreScience-" .. LSlib.utils.string.split(
      LSlib.utils.string.split(
        data.raw["tool"]["infused-"..string.format(scienceName, "pack")].order or "-", "-"
      )[3], "["
    )[1] .. "[" .. string.format(scienceName, "pack") .. "]"
  )
end

-- redo the icons since SCT changed them
for potionName, potionNumber in pairs({
  [scienceNames.red   ] = "14",
  [scienceNames.green ] = "03",
  [scienceNames.gray  ] = "09",
  [scienceNames.blue  ] = "08",
  [scienceNames.purple] = "10",
  [scienceNames.yellow] = "02",
  [scienceNames.white ] = "01",
}) do
  LSlib.item.changeIcons("tool", string.format(potionName, "pack"), {
    {
      icon = "__MoreScience__/graphics/icons/potion/set-01/potion-" .. potionNumber .. ".png",
      icon_size = 32,
    },
    {
      icon = "__MoreScience__/graphics/icons/potion/cork.png",
      icon_size = 32,
    },
  }, nil)
end
