extends Node3D

@export var projectile: PackedScene
@onready var cannon: MeshInstance3D = $Cannon

func _on_timer_timeout() -> void:
	var shot = projectile.instantiate()
	add_child(shot)
	shot.global_position = cannon.global_position
