extends StaticBody2D

@export var puzzleGUI: Control



func player_interact():
	puzzleGUI.visible = true
	PlayerManager.interacting = true


