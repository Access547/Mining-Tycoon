extends PanelContainer
@onready var quantity_label = $QuantityLabel
@onready var texture_rect = $MarginContainer/TextureRect

signal slot_clicked(index: int, button: int)


func _ready():
		if !has_signal(str(gui_input)):
			gui_input.connect(_on_gui_input)

#Sets the data for a specific slot (tells you what item is in that slot)
func set_slot_data(slot_data: SlotData):
	var item_data = slot_data.item_data
	texture_rect.texture = item_data.texture
	tooltip_text = "%s\n%s" % [item_data.name, item_data.description]
	
	
	#Shows quantity label in inventory
	if slot_data.quantity > 1:
		quantity_label.text = "x%s" % slot_data.quantity
		quantity_label.show()
	else:
		quantity_label.hide()


func _on_gui_input(event):
	print("dwadwa")
	if event is InputEventMouseButton \
			and (event.button_index == MOUSE_BUTTON_LEFT \
			or event.button_index == MOUSE_BUTTON_RIGHT) \
			and event.is_pressed():
		slot_clicked.emit(get_index(), event.button_index)
