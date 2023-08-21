extends Resource
class_name ItemData

@export var name: String = ""
@export_multiline var description: String = ""
@export var stackable: bool = false
@export var value: int = 0
@export var texture: AtlasTexture


func use(target):
	pass
