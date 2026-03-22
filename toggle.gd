extends Button

@export var normal: Texture2D
@export var press: Texture2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	connect("toggled", toggled)

func toggled(t: bool) -> void:
	Global.PAUSE = t
	if t == true:
		icon = normal
	else:
		icon = press
	pass
