
-- Change SCT science group order + change icon
data.raw["item-group"]["sct-science"].inventory_order = nil
data.raw["item-group"]["sct-science"].icon = data.raw["item"]["sct-waste-ironcopper"].icon
data.raw["item-group"]["sct-science"].icon_size = data.raw["item"]["sct-waste-ironcopper"].icon_size
data.raw["item-group"]["sct-science"].order = data.raw["item-group"]["ms-science"].order .. "-a[intermediate]"

data.raw["item-group"]["ms-science"].order = data.raw["item-group"]["ms-science"].order .. "-b[packs]"
