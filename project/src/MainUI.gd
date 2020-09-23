extends Control

func _ready():
	get_node("AnimationPlayer").play("MainAnim")

func _input(event):
	if event is InputEventMouseButton:
		var _ignored = get_tree().change_scene("res://src/World.tscn")
