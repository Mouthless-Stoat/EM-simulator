extends Sprite2D

@export var charge := 1
@export var init_vel := Vector2(10, 0)
@export var mass := 1

var is_running = true

@export var vel := init_vel
@export var acc: Vector2
@export var F_e: Vector2
@export var F_b: Vector2


func _ready() -> void:
	vel = init_vel
	self_modulate = Color.from_string("#ff6b6b", "#ffffff") if charge == 1 else Color.from_string("#6b8fff", "#ffffff")

func _process(delta: float) -> void:
	if !Global.PAUSE:
		proc()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func proc() -> void:
	if !is_running:
		return
	var q = Global.q * charge
	F_e = (q * Global.E_STR * Global.HAVE_E) * Vector2.UP
	F_b = Vector2(q * vel.length() * Global.B_STR * Global.HAVE_B, 0).rotated(vel.angle() + 3 * PI/2 + PI)

	acc = (F_e+F_b)/(mass*Global.me)
	
	vel += F_e/(mass*Global.me)
	vel = vel.rotated(F_b.length()/(Global.me * mass * vel.length()) * charge)

	
	position += vel

	$EArrow.vec = F_e
	$BArrow.vec = F_b
	$VArrow.vec = vel
	$AArrow.vec = acc

func _on_exit() -> void:
	is_running = false
