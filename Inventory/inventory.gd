extends PanelContainer


const slot = preload("res://Inventory/slot.tscn")

@onready var itemGrid = $MarginContainer/ItemGrid

func set_inventory_data(inventory_data: InventoryData):
	inventory_data.inventory_updated.connect(populate_item_grid)
	populate_item_grid(inventory_data)
	

func clear_inventory_data(inventory_data: InventoryData):
	inventory_data.inventory_updated.disconnect(populate_item_grid)

#Populates item grid by grabbing all children of the grid container and looping and instantiating slots 
func populate_item_grid(inventory_data: InventoryData):
	for child in itemGrid.get_children():
		child.queue_free()
		
	for slotData in inventory_data.slot_datas:
		var slot = slot.instantiate()
		itemGrid.add_child(slot)
		
		if !inventory_data.has_signal(str(slot.slot_clicked)):
			slot.slot_clicked.connect(inventory_data.on_slot_clicked)
		
		if slotData:
			slot.set_slot_data(slotData)
