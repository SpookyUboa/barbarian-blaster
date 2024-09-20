extends Node3D

@export var projectile: PackedScene
@onready var cannon: MeshInstance3D = $Cannon

var enemy_path : Path3D

func _physics_process(delta: float) -> void:
	var enemy = enemy_path.get_children().back()
	cannon.look_at(enemy.global_position, Vector3.UP, true)

func _on_timer_timeout() -> void:
	var shot = projectile.instantiate()
	add_child(shot)
	shot.global_position = cannon.global_position
	shot.direction = cannon.basis.z
