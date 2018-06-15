
-- move science groups together
data.raw["item-group"]["sct-science"].order = data.raw["item-group"]["ms-science"].order .. "-a[intermediate]"
data.raw["item-group"]["ms-science"].order = data.raw["item-group"]["ms-science"].order .. "-b[packs]"
