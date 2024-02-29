extends Area2D


@export var enemies = []
#@onready var slime_enemy = preload("res://enemy.tscn")
#@onready var wind_enemy = preload("res://wind_enemy.tscn")
@onready var label = $Label
var timeout_count = 0

func _ready():
	label.set_tooltip_text(str(self.position.x) +" " + str(self.position.y))

func _process(_delta):
	if timeout_count == 5:
		queue_free()

#func _on_timer_timeout():
	#timeout_count += 1
	#var random_value = randf()
	#var enemy_instance = null
	
	#if random_value < 0.25:
	#	enemy_instance = wind_enemy.instantiate()
	#else:
	#	enemy_instance = slime_enemy.instantiate()

	#if enemy_instance:
	#	enemy_instance.global_position = self.global_position
	#	get_parent().add_child(enemy_instance)
