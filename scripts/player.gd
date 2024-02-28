extends CharacterBody2D

@onready var animator = $AnimatedSprite2D
@onready var dash_timer = $Timer

@export var health = 100
@export var player_speed = 50
@export var attack_damage = 10

func _process(delta):
	var direction = Input.get_vector("left", "right", "up", "down")
	velocity = direction * player_speed
	
	if direction != Vector2.ZERO:
		animator.play("walk")
	else:
		animator.stop()
		
	if Input.is_action_just_pressed("left"):
		animator.flip_h = true
	
	if Input.is_action_just_pressed("right"):
		animator.flip_h = false
	
	if is_on_wall():
		print("wall")
	if is_on_ceiling():
		print("teto")
	if is_on_floor():
		print("floor")
	
	move_and_slide()

func _input(event):
	#TODO: implement dash cooldown
	if Input.is_action_pressed("dash"):
		dash_timer.start()
 			
		var tween = get_tree().create_tween()
		tween.tween_property(self, "position", position + velocity * 0.5, 0.25)
	 
		await tween.finished
		dash_timer.stop()
		
		if is_on_wall() or is_on_ceiling() or is_on_floor():
			tween.stop()
