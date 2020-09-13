extends RigidBody2D

export var rotation_speed := 1.0
export var power_change_rate := 200.0

var bullet_angle := 50.0
var bullet_power := 1000.0
var _magazine_max := 5
var _magazine_current := 5
var is_fired := false

const MIN_POWER := 200
const MAX_POWER := 1000
const MIN_ARROW_LENGTH := 50.0
const MAX_ARROW_LENGTH := 150.0

func _process(delta):
	if is_fired:
		return
	
	if Input.is_action_pressed("angle_up"):
		bullet_angle -= rotation_speed * delta
	if Input.is_action_pressed("angle_down"):
		bullet_angle += rotation_speed * delta
	bullet_angle = clamp(bullet_angle, - PI / 2, 0)
	update()	
	
	if Input.is_action_pressed("power_up"):
		bullet_power += power_change_rate * delta
	if Input.is_action_pressed("power_down"):
		bullet_power -= power_change_rate * delta
	bullet_power = clamp(bullet_power, MIN_POWER, MAX_POWER)
	
	if Input.is_action_just_pressed("fire"):
		var direction = Vector2(1,0).rotated(bullet_angle)
		var velocity = direction * bullet_power
		apply_impulse(Vector2.ZERO, velocity)
		_magazine_current -= 1;
		$Fire.play()
		is_fired = true

func _draw():
	if not is_fired:
		var arrow_length = range_lerp(bullet_power, 
			MIN_POWER,
			MAX_POWER, 
			MIN_ARROW_LENGTH, 
			MAX_ARROW_LENGTH)
		var arrow_angle = Vector2(arrow_length, 0).rotated(bullet_angle)
		draw_line(Vector2.ZERO, arrow_angle, Color.red, 5)


func _on_Bullet_sleeping_state_changed():
	self.queue_free()
	
