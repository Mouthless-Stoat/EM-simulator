extends HSlider

@export var friend: SpinBox

func _ready() -> void:
	connect("value_changed", _on_value_changed)
	friend.connect("value_changed", _on_friend_change)
	friend.min_value = min_value
	friend.max_value = max_value
	friend.step = 0.1
	friend.value = value

func _on_value_changed(value: float) -> void:
	friend.value = value
	
func _on_friend_change(v: float) -> void:
	value = v
