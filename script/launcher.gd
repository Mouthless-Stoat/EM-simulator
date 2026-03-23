extends Sprite2D

func _process(delta: float) -> void:
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) \
		and %SubViewportContainer.get_rect().has_point(get_global_mouse_position()):
		position = get_global_mouse_position()
