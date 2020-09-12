extends RigidBody2D

export var rotation_speed := 1.0
export var power_change_rate := 200.0

var _angle := 0.0
var _fired := false
var _power := 500.0
var _magazine_max := 5
var _magazine_current := 5

const MIN_POWER := 200
const MAX_POWER := 1000
const MIN_ARROW_LENGTH := 50.0
const MAX_ARROW_LENGTH := 150.0

func _process(delta):
	if _fired:
		return
	
	if Input.is_action_pressed("angle_up"):
		_angle -= rotation_speed * delta
	if Input.is_action_pressed("angle_down"):
		_angle += rotation_speed * delta
	_angle = clamp(_angle, - PI / 2, 0)
	update()	
	
	if Input.is_action_pressed("power_up"):
		_power += power_change_rate * delta
	if Input.is_action_pressed("power_down"):
		_power -= power_change_rate * delta
	_power = clamp(_power, MIN_POWER, MAX_POWER)
	
	if Input.is_action_just_pressed("fire"):
		var direction = Vector2(1,0).rotated(_angle)
		var velocity = direction * _power
		apply_impulse(Vector2.ZERO, velocity)
		_magazine_current -= 1;
		_fired = true

func _draw():
	if not _fired:
		var arrow_length = range_lerp(_power, 
			MIN_POWER,
			MAX_POWER, 
			MIN_ARROW_LENGTH, 
			MAX_ARROW_LENGTH)
		var arrow_angle = Vector2(arrow_length, 0).rotated(_angle)
		draw_line(Vector2.ZERO, arrow_angle, Color.red, 5)


func _on_Bullet_sleeping_state_changed():
	queue_free()

