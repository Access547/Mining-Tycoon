extends Control

var textToDisplay: Array[String]
var textDisplaying: int = 0
@onready var text = $MarginContainer/MarginContainer/HBoxContainer/Text
@onready var portrait = $MarginContainer2/Portrait

var portraitImage

# Called when the node enters the scene tree for the first time.
func _ready():
	visibility_changed.connect(on_visibility_changed)
	PlayerManager.playerCanMove = false


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		if Input.is_action_just_pressed("left_click"):
			
			if textDisplaying < textToDisplay.size() - 1:
			
				textDisplaying += 1
				set_text()
			elif textDisplaying == textToDisplay.size() - 1:
				textDisplaying = 0
				textToDisplay.clear()
				visible = false
func on_visibility_changed():
	if visible:
		set_text()
		set_portrait()
	else:
		print("hello")
		PlayerManager.interacting = false
	
	

func set_text():
	text.text = textToDisplay[textDisplaying]
	
func set_portrait():
	portrait.texture = portraitImage
