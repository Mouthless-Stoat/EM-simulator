extends Control

var particle := preload("res://packed/particle/particle.tscn")
var recent: Node

func round_to_2(f: float) -> float:
	return round(f * 100) / 100

func _process(delta: float) -> void:
	if recent == null:
		%FE.text = "- N"
		%FB.text = "- N"
		%Vel.text = "- m/s" 
		%Acc.text = "- m/s²"
	else:
		%FE.text = "%s N" % round_to_2(recent.F_e.length())
		%FB.text = "%s N" % round_to_2(recent.F_b.length())
		%Vel.text = "%s m/s" % round_to_2(recent.vel.length())
		%Acc.text = "%s m/s²" % round_to_2(recent.acc.length())
		

func _on_enable_electric_toggled(toggled_on: bool) -> void:
	Global.HAVE_E = toggled_on as int

func _on_enable_magnetic_toggled(toggled_on: bool) -> void:
	Global.HAVE_B = toggled_on as int
	

func _E_str_changed(value: float) -> void:
	Global.E_STR = value
	
func _B_str_changed(value: float) -> void:
	Global.B_STR = value

func launch_particle() -> void:
	var new_particle := particle.instantiate()
	new_particle.charge = (%Positive.disabled as int) * 2 - 1
	new_particle.position = %Launcher.position
	new_particle.init_vel = %InitVel.value * Vector2.RIGHT
	new_particle.mass = %Mass.value

	%Forward.connect("pressed", new_particle.proc)
	%SubViewport.add_child(new_particle)
	new_particle.name += "Particle"
	recent = new_particle


func clear_particle() -> void:
	for child in %SubViewport.get_children():
		if "Particle" in child.name:
			child.queue_free()
