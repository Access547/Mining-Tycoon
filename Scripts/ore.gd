extends StaticBody2D


const minigame_scene = preload("res://Scenes/Pickaxe Minigame.tscn")
const pickup_scene = preload("res://Items/pickup.tscn")

@export var pickup_data: SlotData
@export var health: int

@onready var marker_2d = $Marker2D
@onready var canvas_layer = $CanvasLayer




func player_interact():
	PlayerManager.playerCanMove = false
	var minigameObj = minigame_scene.instantiate()
	minigameObj.oreParent = self
	canvas_layer.add_child(minigameObj)
	
	
	
func create_pickup(slot_data: SlotData, amount: int):
	var pick_up = pickup_scene.instantiate()
	pick_up.slot_data = slot_data
	pick_up.slot_data.quantity = amount
	pick_up.position = marker_2d.position
	add_child(pick_up)

func run_pickup(amount: int):
	create_pickup(pickup_data, amount)
