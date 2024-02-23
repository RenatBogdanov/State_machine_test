extends CharacterBody2D
class_name KnightEnemy

func _physics_process(delta):
	move_and_slide()
	$AnimatedSprite2D.play("idle")
