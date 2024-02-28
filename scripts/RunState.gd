extends Node

var fsm: StateMachine
signal isRun(direction: String)

func enter():
	print("Run")
	isRun.emit("stay")
	# Exit 2 seconds later
	await get_tree().create_timer(0.2).timeout
	if randf() > 0.5:
		isRun.emit("right")
	else:
		isRun.emit("left")
	await get_tree().create_timer(0.2).timeout
	exit("IdleState")

func exit(next_state):
	fsm.change_to(next_state)
	isRun.emit("stay")


func _unhandled_key_input(event):
	if event.pressed:
		print("Run")
