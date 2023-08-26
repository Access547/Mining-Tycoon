extends CharacterBody2D

@export var inventory_data: InventoryData

signal toggle_inventory()


var moveSpeed = 100
var inInteractableArea = false
var interactable = null
var health = 5


func _ready():
	PlayerManager.player = self

func _physics_process(delta):
	
	if PlayerManager.playerCanMove:
		var directionX = Input.get_axis("move_left", "move_right")
		if directionX:
			velocity.x = directionX * moveSpeed
		else:
			velocity.x = 0
			
		var directionY = Input.get_axis("move_up", "move_down")
		if directionY:
			velocity.y = directionY * moveSpeed
		else:
			velocity.y = 0

		move_and_slide()
	
	
func _process(delta):
	
	if inInteractableArea:
		if PlayerManager.playerCanMove:
			if Input.is_action_just_pressed("interact"):
				interact()
	
	if Input.is_action_just_pressed("inventory"):
		toggle_inventory.emit()
	



func _on_area_2d_body_entered(body):
	if body.is_in_group("Interactable"):
		inInteractableArea = true
		interactable = body


func interact():
	if interactable:
		interactable.player_interact()
	
	
func get_drop_position() -> Vector2:
	return get_global_mouse_position()

func heal(heal_value: int):
	health += heal_value


func _on_area_2d_body_exited(body):
	interactable = null
