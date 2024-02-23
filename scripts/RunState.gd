extends Node

var fsm: StateMachine
signal isRun(check: bool)

func enter():
	print("Run")
	isRun.emit(true)
	# Exit 2 seconds later
	await get_tree().create_timer(0.2).timeout
	isRun.emit(false)
	exit("IdleState")

func exit(next_state):
	fsm.change_to(next_state)


func _unhandled_key_input(event):
	if event.pressed:
		print("Run")
