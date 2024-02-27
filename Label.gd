extends Label

var elapsed_seconds = 0

@onready var timer = $Timer

func _ready():
	# Connect the timer's timeout signal to the _on_Timer_timeout function
	timer.connect("timeout", _on_Timer_timeout)

func _on_Timer_timeout():
	elapsed_seconds += 1
	update_label()

func update_label():
	var minutes = elapsed_seconds / 60
	var seconds = elapsed_seconds % 60

	# Format the elapsed time as mm:ss
	text = "%02d:%02d" % [minutes, seconds]
