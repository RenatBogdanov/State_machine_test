extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0
var isRun = 0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = 0

func _ready():
	pass

func _physics_process(delta):
	var velocity = Vector2.ZERO
	if isRun and (position.x < 1000):
		$AnimatedSprite2D.play("run")
		velocity.x += 1
	elif isRun and (position.x >= 1000):
		$AnimatedSprite2D.play("idle")
	
	velocity = velocity.normalized() * SPEED
	position += velocity * delta

func _on_run_state_is_run(check: bool):
	if check:
		isRun = 1
	else:
		isRun = 0
