extends StaticBody2D

@export var slot_data: SlotData
@onready var sprite_2d = $Sprite2D



# Called when the node enters the scene tree for the first time.
func _ready():
	sprite_2d.texture = slot_data.item_data.texture


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_body_entered(body: Node2D):
	if body.is_in_group("Player"):
		if body.inventory_data.pick_up_slot_data(slot_data):
			queue_free()
