local scienceNames = require("prototypes/settings").scienceNames

if data.raw["tool"]["science-pack-gold"] then
  -- change graphics of alien science packs
  local icons = LSlib.item.getIcons("tool", "alien-science-pack")
  table.insert(icons, {
    icon = "__MoreScience__/graphics/icons/potion/cork.png",
    icon_size = 32,
  })
  LSlib.item.changeIcons("tool", "science-pack-gold", icons)
  LSlib.recipe.removeIngredient("science-pack-gold", "alien-empty-bottle")

  local potionLocation = "__MoreScience__/graphics/icons/potion/set-04/potion-%02d.png"
  LSlib.item.changeIcon("tool", "alien-science-pack", string.format(potionLocation, 13), 32)

  -- move the alien science packs back to where they belong
  local alienSciencePack = "alien-science-pack%s"
  for _, packName in pairs({
    "science-pack-gold",
    string.format(alienSciencePack, ""       ),
    string.format(alienSciencePack, "-red"   ),
    string.format(alienSciencePack, "-orange"),
    string.format(alienSciencePack, "-yellow"),
    string.format(alienSciencePack, "-green" ),
    string.format(alienSciencePack, "-blue"  ),
    string.format(alienSciencePack, "-purple"),
  }) do
    LSlib.item.setSubgroup("tool", packName, "ms-science-alien-science-pack")
    LSlib.item.setOrderstring("tool", packName, string.format("%s-%s",
      LSlib.item.getOrderstring("tool", string.format(scienceNames.blue, "pack")),
      LSlib.item.getOrderstring("tool", packName)))

    LSlib.recipe.setSubgroup(packName, nil)
    LSlib.recipe.setOrderstring("tool", packName, nil)
  end
end

if data.raw["item-subgroup"]["science-alien-packs"] then
  data.raw["item-subgroup"]["science-alien-packs"].group = "ms-science"
end

if data.raw["item-subgroup"]["ms-science-alien-science-pack"] then
  data.raw["item-subgroup"]["ms-science-alien-science-pack"].group = "ms-science"
  data.raw["item-subgroup"]["ms-science-alien-science-pack"].order = "g-c[science-pack]-c"
end
