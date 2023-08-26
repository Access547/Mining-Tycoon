extends StaticBody2D


@export var npcData: NPCData


func _ready():
	$Sprite2D.texture = npcData.sprite
	
func player_interact():
	print(npcData.dialogue[0])
	print(npcData.dialogue[1])
