extends StaticBody2D

signal toggle_inventory(external_inventory_owner)

@export var inventory_data: InventoryData



func player_interact():
	toggle_inventory.emit(self)
	


func _process(delta):
	if Input.is_action_just_pressed("sell"):
		for i in inventory_data.slot_datas.size():
			if inventory_data.slot_datas[i]:
				var slot = inventory_data.slot_datas[i]
				var item = inventory_data.slot_datas[i].item_data
				var itemValue = slot.quantity * item.value
				
				NumberManager.addMoney(itemValue)
				inventory_data.slot_datas[i] = null
			else:
				pass
				
		inventory_data.inventory_updated.emit(inventory_data)
