extends Control

var valueL = 1
var valueM = 1
var valueR = 1
@export var linkyThing: StaticBody2D
@export var pedestal: StaticBody2D

func _process(delta):
	if valueL == 4 and valueM == 7 and valueR == 2:
		linkyThing.on = true
		PlayerManager.interacting = false
		pedestal.remove_from_group("Interactable")
		queue_free()

#Left
func _on_lub_pressed():
	valueL -= 1
	wrapNumber(valueL)
	valueL = wrapNumber(valueL)
	changeSprite($"HBoxContainer/Left/L Symbol", valueL)
	printValues()
func _on_ldb_pressed():
	valueL += 1	
	valueL = wrapNumber(valueL)
	changeSprite($"HBoxContainer/Left/L Symbol", valueL)
	printValues()
#Middle
func _on_mub_pressed():
	valueM -= 1
	wrapNumber(valueM)
	valueM = wrapNumber(valueM)
	changeSprite($"HBoxContainer/Mid/M Symbol", valueM)
	printValues()
func _on_mdb_pressed():
	valueM += 1
	wrapNumber(valueM)
	valueM = wrapNumber(valueM)
	changeSprite($"HBoxContainer/Mid/M Symbol", valueM)
	printValues()
#Right
func _on_rub_pressed():
	valueR -= 1
	wrapNumber(valueR)
	valueR = wrapNumber(valueR)
	changeSprite($"HBoxContainer/Right/R Symbol", valueR)
	printValues()
func _on_rdb_pressed():
	valueR += 1
	wrapNumber(valueR)
	valueR = wrapNumber(valueR)
	changeSprite($"HBoxContainer/Right/R Symbol", valueR)
	printValues()
	
func printValues():
	print(str(valueL, ",", valueM, ",", valueR))

func changeSprite(sprite, value):
	var region
	match value:
		1:
			region = Rect2(0,0,8,8)
		2:
			region = Rect2(8,0,8,8)
		3:
			region = Rect2(16,0,8,8)
		4:
			region = Rect2(24,0,8,8)
		5:
			region = Rect2(0,8,8,8)
		6:
			region = Rect2(8,8,8,8)
		7:
			region = Rect2(16,8,8,8)
		8:
			region = Rect2(24,8,8,8)
		_:
			region = Rect2(0,0,8,8)
			
	sprite.texture.set_region(region)
	
func wrapNumber(value):
	if value <= 0:
		value = 8
	elif value > 8:
		value = 1
	return value
