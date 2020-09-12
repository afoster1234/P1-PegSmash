extends Node

var bullet_preload = preload("res://src/Bullet.tscn")

var score
var magazine_size := 10
var ready_for_fire := true


func _process(delta):
	if Input.is_action_just_pressed("reload"):
		if ready_for_fire:
			load_bullet()


func load_bullet():
	if magazine_size > 0:
		var bullet = bullet_preload.instance()
		get_parent().add_child(bullet)
		magazine_size = magazine_size - 1
		ready_for_fire = false


func _on_BulletTimer_timeout():
	ready_for_fire = true
