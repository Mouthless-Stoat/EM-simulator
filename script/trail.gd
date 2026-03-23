extends Line2D

var point

func _process(delta):
	add_point(get_parent().global_position)
