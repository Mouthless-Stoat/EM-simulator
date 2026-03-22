extends Line2D

@export var vec := Vector2.ZERO

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	visible = vec.length() != 0
	points[1].x = (vec.length()) * 10
	rotation = vec.angle()
