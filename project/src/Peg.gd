extends Area2D

signal hit

func _on_Peg_body_entered():
	emit_signal("hit")
	queue_free()
