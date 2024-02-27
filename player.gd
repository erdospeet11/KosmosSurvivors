extends CharacterBody2D

@onready var animator = $AnimatedSprite2D

var speed = 50  # speed in pixels/sec

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * speed
	
	if direction != Vector2.ZERO:
		animator.play("walk")
	else:
		animator.stop()
		
	if Input.is_action_just_pressed("left"):
		animator.flip_h = true
	
	if Input.is_action_just_pressed("right"):
		animator.flip_h = false
	
	move_and_slide()

