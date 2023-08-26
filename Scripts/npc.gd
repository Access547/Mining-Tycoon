extends StaticBody2D


@export var npcData: NPCData
@export var textBox: Control


func _ready():
	$Sprite2D.texture = npcData.sprite
	
func player_interact():
	textBox.portraitImage = npcData.portrait
	textBox.textToDisplay.append_array(npcData.dialogue)
	textBox.visible = true
