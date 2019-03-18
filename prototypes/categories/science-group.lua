
-- move science groups together
local orderString = LSlib.item.getOrderstring("item-group", "ms-science", orderstring) or ""
LSlib.item.setOrderstring("item-group", "sct-science", orderString.. "-a[intermediate]")
LSlib.item.setOrderstring("item-group", "ms-science" , orderString.. "-b[packs]"       )
