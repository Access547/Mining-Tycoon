extends Control




func _on_texture_button_2_pressed():
	#Iron Pick upgrade
	PlayerManager.pickLevel = 2
	print(PlayerManager.pickLevel)


func _on_exit_button_pressed():
	visible = false
	PlayerManager.interacting = false
