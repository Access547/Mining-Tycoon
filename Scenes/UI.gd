extends Control

@onready var rich_text_label = $MarginContainer/RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	rich_text_label.set_text(str("Money: $", NumberManager.money))
