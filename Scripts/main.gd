extends Node2D

const PickUp = preload("res://Items/pickup.tscn")

@onready var player = $Player
@onready var inventory_interface = $UI/InventoryInterface


# Called when the node enters the scene tree for the first time.
func _ready():
	player.toggle_inventory.connect(toggle_inventory_interface)
	inventory_interface.set_player_inventory_data(player.inventory_data)
	
	for node in get_tree().get_nodes_in_group("external_inventory"):
		node.toggle_inventory.connect(toggle_inventory_interface)


#toggles the inventory interface to be visible or 'open' by pressing a button.
func toggle_inventory_interface(external_inventory_owner = null):
	inventory_interface.visible = not inventory_interface.visible
	
	if inventory_interface.visible:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
		
	if external_inventory_owner and inventory_interface.visible:
		inventory_interface.set_external_inventory(external_inventory_owner)
	else:
		inventory_interface.clear_external_inventory()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("exit_game"):
		get_tree().quit()


func _on_inventory_interface_drop_slot_data(slot_data):
	var pick_up = PickUp.instantiate()
	pick_up.slot_data = slot_data
	pick_up.position = player.get_drop_position()
	add_child(pick_up)
