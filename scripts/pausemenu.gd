extends CanvasLayer

func _on_quit_pressed():
	get_tree().quit()

func _on_resume_pressed():
	self.visible = false

func _process(_delta):
	if Input.is_action_just_pressed('escape') and !self.visible:
		self.visible = true
