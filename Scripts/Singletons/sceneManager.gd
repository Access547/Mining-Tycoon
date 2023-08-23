extends Node

var savedScene
var newScene
var dwa = preload("res://Scenes/levels/base.tscn")


func save_scene(_savedScene):
	savedScene = _savedScene
	var packedScene = PackedScene.new()
	#packedScene.pack(get_node(get_tree().current_scene))
	newScene = ResourceSaver.save(dwa, "res://Scenes/levels/")


func load_scene():
	get_tree().change_scene_to_packed(newScene)
