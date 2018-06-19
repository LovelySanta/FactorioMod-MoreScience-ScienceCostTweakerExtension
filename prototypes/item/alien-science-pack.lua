
-- move the alien science packs back to where they belong
for _, packName in pairs({
  "science-pack-gold",
  "alien-science-pack",
  "alien-science-pack-blue",
  "alien-science-pack-orange",
  "alien-science-pack-purple",
  "alien-science-pack-yellow",
  "alien-science-pack-green",
  "alien-science-pack-red",
}) do
  data.raw["tool"][packName].subgroup = "science-alien-packs"
  data.raw["recipe"][packName].subgroup = nil
end


if data.raw["item-subgroup"]["science-alien-packs"] then
  data.raw["item-subgroup"]["science-alien-packs"].group = "ms-science"
end
