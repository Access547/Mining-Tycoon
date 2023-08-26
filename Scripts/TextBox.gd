extends Control

var textToDisplay: Array[String]
var textDisplaying: int = 0
@onready var text = $MarginContainer/MarginContainer/HBoxContainer/Text
@onready var portrait = $MarginContainer2/Portrait

var portraitImage

# Called when the node enters the scene tree for the first time.
func _ready():
	visibility_changed.connect(on_visibility_changed)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if visible:
		if Input.is_action_just_pressed("left_click"):
			
			if textDisplaying < textToDisplay.size() - 1:
				print("dwa")
				textDisplaying += 1
				set_text()
			elif textDisplaying == textToDisplay.size() - 1:
				textDisplaying = 0
				textToDisplay.clear()
				visible = false
	
	print(str("Text Displaying: ", textDisplaying))
	print(str("Text to Display: ", textToDisplay.size()))
func on_visibility_changed():
	if visible:
		set_text()
		set_portrait()
	else:
		return
	
	

func set_text():
	text.text = textToDisplay[textDisplaying]
	
func set_portrait():
	portrait.texture = portraitImage
