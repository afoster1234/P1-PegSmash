extends Node


export var bullet_preload = preload("res://src/Bullet.tscn")

var score
var magazine_size = 5

func load_bullet():
	if magazine_size > 0:
		var bullet = bullet_preload.instance()
		get_parent().add_child(bullet)
		magazine_size = magazine_size - 1

func _process(delta):
	if Input.is_action_just_pressed("reload"):
		load_bullet()
