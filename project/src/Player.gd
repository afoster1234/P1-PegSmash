extends KinematicBody2D

export var speed = 400


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	var direction = Vector2()
	if Input.is_action_pressed("right"):
		direction += Vector2(1, 0)
	if Input.is_action_pressed("left"):
		direction += Vector2(-1,0)
	move_and_slide(direction * speed)
	if direction.x != 0:
		$Sprite.flip_h = direction.x < 0
a
