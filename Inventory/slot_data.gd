extends Resource
class_name SlotData

const maxStackSize: int = 99


@export var item_data: ItemData
@export_range(1, maxStackSize) var quantity: int = 1: set = set_quantity


func can_merge_with(other_slot_data: SlotData) -> bool:
	return item_data == other_slot_data.item_data \
			and item_data.stackable \
			and quantity < maxStackSize
			
			
func can_fully_merge_with(other_slot_data: SlotData) -> bool:
	return item_data == other_slot_data.item_data \
			and item_data.stackable \
			and quantity + other_slot_data.quantity < maxStackSize
			
func fully_merge_with(other_slot_data: SlotData):
	quantity += other_slot_data.quantity
	

func create_single_slot_data() -> SlotData:
	var new_slot_data = duplicate()
	new_slot_data.quantity = 1
	quantity -= 1
	return new_slot_data

func set_quantity(value: int):
	quantity = value
	if quantity > 1 and not item_data.stackable:
		quantity = 1
		push_error("%s is not stackable, setting quantity to 1" % item_data.name)
	