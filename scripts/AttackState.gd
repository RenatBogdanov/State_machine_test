extends Node


var fsm: StateMachine
	
func enter():
	print("Attack")
	var _animated_sprite = get_parent().get_parent().get_node("AnimatedSprite2D")
	_animated_sprite.play("attack")
	# Exit 2 seconds later
	await get_tree().create_timer(0.4).timeout
	exit("IdleState")


func exit(next_state):
	fsm.change_to(next_state)


func _unhandled_key_input(event):
	if event.pressed:
		print("Attack")
