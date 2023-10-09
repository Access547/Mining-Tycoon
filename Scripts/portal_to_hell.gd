extends StaticBody2D


@onready var animated_sprite_2d = $AnimatedSprite2D
@onready var scene_mover = $"../ToHell"

var on = false

func _ready():
	scene_mover.set_process_input(false)

func _process(delta):
	if on:
		if animated_sprite_2d.animation != "On":
			animated_sprite_2d.play("On")
			scene_mover.visible = true
			scene_mover.set_process_input(true)

