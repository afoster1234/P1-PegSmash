extends Node

var bullet_preload = preload("res://src/Bullet.tscn")

var magazine_size := 10
var targets_remaining = 6
var ready_for_fire := false

func _process(_delta):
	if ready_for_fire == false:
		$ReloadMessage.text = ("Preparing Chamber")
	if ready_for_fire == true:
		$ReloadMessage.text = ("Chamber Ready")
	if targets_remaining == 0:
		$WinMessage.text = ("YOU WIN!")
	if Input.is_action_just_pressed("reload"):
		if ready_for_fire:
			load_bullet()

func load_bullet():
	if magazine_size > 0:
		var bullet = bullet_preload.instance()
		get_parent().add_child(bullet)
		magazine_size = magazine_size - 1
		$BulletCount.text = String(magazine_size)
		$BulletCount.show()
		$Load.play()
		ready_for_fire = false

func _on_BulletTimer_timeout():
	ready_for_fire = true

func _on_Peg1_hit():
	targets_remaining -= 1
	$TargetCount.text = String(targets_remaining)
	$TargetCount.show()
	$TargetHit.play()
func _on_Peg2_hit():
	targets_remaining -= 1
	$TargetCount.text = String(targets_remaining)
	$TargetCount.show()
	$TargetHit.play()
func _on_Peg3_hit():
	targets_remaining -= 1
	$TargetCount.text = String(targets_remaining)
	$TargetCount.show()
	$TargetHit.play()
func _on_Peg4_hit():
	targets_remaining -= 1
	$TargetCount.text = String(targets_remaining)
	$TargetCount.show()
	$TargetHit.play()
func _on_Peg5_hit():
	targets_remaining -= 1
	$TargetCount.text = String(targets_remaining)
	$TargetCount.show()
	$TargetHit.play()
func _on_Peg6_hit():
	targets_remaining -= 1
	$TargetCount.text = String(targets_remaining)
	$TargetCount.show()
	$TargetHit.play()
func _on_Reload_pressed():
	magazine_size = 10
	$BulletCount.text = String(magazine_size)
	$BulletCount.show()
