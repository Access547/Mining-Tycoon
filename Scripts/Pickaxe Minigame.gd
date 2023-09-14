extends PanelContainer

@onready var cursor = $Cursor

var cursorMovingRight = true
var cursorPosition
var oreParent

func _ready():
	pass

func _process(delta):
	if cursorMovingRight:
		cursor.position.x += 2
	else:
		cursor.position.x -= 2
		
	if cursor.position.x > 275:
		cursorMovingRight = false
	elif cursor.position.x < 10:
		cursorMovingRight = true
		
	if Input.is_action_just_pressed("left_click"):
		
		cursor.position.x = 10
		
		
		match cursorPosition:
			"Inner":
				oreParent.run_pickup(3)
			"Outer":
				oreParent.run_pickup(2)
			"Outermost":
				oreParent.run_pickup(1)
		oreParent.health -= 1
		
		if oreParent.health <= 0:
			oreParent.queue_free()
			queue_free()
			PlayerManager.interacting = false
			
				


func _on_area_2d_area_entered(area):
	
	if area.is_in_group("Inner"):
		cursorPosition = "Inner"
	elif area.is_in_group("Outer"):
		cursorPosition = "Outer"
	elif area.is_in_group("Outermost"):
		cursorPosition = "Outermost"
	elif area.is_in_group("None"):
		cursorPosition = "None"
		
#		match area.is_in_group():
#		"Inner":
#			cursorPosition = "Inner"
#		"Outer":
#			cursorPosition = "Outer"
#		"Outermost":
#			cursorPosition = "Outermost"
#		"None":
#			cursorPosition = "None"
#		_:
#			cursorPosition = null
	
func disable():
	set_process(false)
	set_physics_process(false)
	visible = false
	
func enable():
	set_process(true)
	set_physics_process(true)
	visible = true
