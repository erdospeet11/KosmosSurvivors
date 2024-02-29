extends CanvasLayer

func _on_resume_pressed():
	self.visible = false

func _process(_delta):
	if Input.is_action_just_pressed('inventory'):
		self.visible = !self.visible
