extends Label

func _process(delta: float) -> void:
	set_text(str("FPS ", str(Engine.get_frames_per_second())))
