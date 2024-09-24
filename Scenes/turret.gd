extends Node3D

@export var projectile: PackedScene
@export var turret_range := 10.0
@export var enemy_path : Path3D

@onready var cannon: MeshInstance3D = $Cannon
@onready var animation_player: AnimationPlayer = $AnimationPlayer


var target: PathFollow3D

func _physics_process(delta: float) -> void:
	target = find_best_target()
	if target:
		look_at(target.global_position, Vector3.UP, false)

func _on_timer_timeout() -> void:
	if target:
		animation_player.play("Shot")
		var shot = projectile.instantiate()
		add_child(shot)
		shot.global_position = cannon.global_position
		shot.direction = cannon.global_transform.basis.z

func find_best_target() -> PathFollow3D:
	var best_target = null
	var best_progress = 0.0
	for enemy in enemy_path.get_children(): 
		if enemy is PathFollow3D:
			if enemy.progress > best_progress:
				var distance := global_position.distance_to(enemy.global_position)
				if distance <= turret_range: 
					best_target = enemy
					best_progress = enemy.progress
	return best_target
