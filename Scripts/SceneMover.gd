extends Area2D


@export var scene: String
@export var levelName: String

const saveFile = "res://Scenes/levels/"

var createdPackage: PackedScene
var canMove: bool = false

# Called when the node enters the scene tree for the first time.
func _ready():
	if !has_signal(str(body_entered)):
			body_entered.connect(_on_body_entered)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if canMove:
		if Input.is_action_just_pressed("space_bar"):
			move_scenes()
		
	


func _on_body_entered(body):
	if body.is_in_group("Player"):
		canMove = true

		
func move_scenes():
		
		createdPackage = ScenePacker.create_package(owner)
		ResourceSaver.save(createdPackage, str(saveFile,"saved/", levelName))
		
		if FileAccess.file_exists(str("res://Scenes/levels/saved/", scene)):
			get_tree().change_scene_to_file(str(saveFile,"saved/", scene))
		else:
			get_tree().change_scene_to_file(str(saveFile, scene))

		
