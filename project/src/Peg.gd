extends Area2D

signal hit

func _draw():
	var radius = $CollisionShape2D.shape.radius
	draw_circle(Vector2.ZERO, radius, Color.red)
	draw_circle(Vector2.ZERO, radius/2, Color.whitesmoke)

func _on_Peg_body_entered(body):
	emit_signal("hit")
	queue_free()
