extends PathFollow3D

@export var speed = 1
@export var max_health := 10
@export var enemy_reward := 50

@onready var animation_player: AnimationPlayer = $AnimationPlayer
@onready var bank = get_tree().get_first_node_in_group("bank")

var current_health : int:
	set(health_in):
		if health_in < current_health:
			animation_player.play("TakeDamage")
		current_health = health_in
		if current_health < 1 :
			bank.gold += enemy_reward
			queue_free()

@onready var base = get_tree().get_first_node_in_group("base")

func _ready() -> void:
	current_health = max_health

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	progress += delta * speed
	if progress_ratio == 1.0 : 
		base.take_damage()
		queue_free()


