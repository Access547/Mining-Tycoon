extends Area2D


@export var scene: String
@export var levelName: String

const saveFile = "res://Scenes/levels/"

var createdPackage: PackedScene
var canMove: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	print(str(canMove))
	if canMove && Input.is_action_just_pressed("interact"):
		move_scenes()
		
		


func _on_body_entered(body):
	if body.is_in_group("Player"):
		canMove = true

		
func move_scenes():
		createdPackage = ScenePacker.create_package(owner)
		print(createdPackage)
		ResourceSaver.save(createdPackage, str(saveFile, levelName))
		
		get_tree().change_scene_to_file(str(saveFile, scene))

		
