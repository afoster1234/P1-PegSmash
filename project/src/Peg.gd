extends Area2D

signal hit

func _on_Peg_body_entered(body):
	emit_signal("hit")
	queue_free()
