# This is use with the postive and negative button
extends Button

@export var friend: Button

func _ready() -> void:
	self.connect("pressed", self._on_pressed)

func _on_pressed() -> void:
	self.disabled = true
	friend.disabled = false
