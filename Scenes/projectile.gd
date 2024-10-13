extends Area3D

var direction := Vector3.FORWARD

@export var speed := 100.0

func _physics_process(delta: float) -> void:
	position += direction * speed * delta


func _on_timer_timeout() -> void:
	queue_free()


func _on_area_entered(area: Area3D) -> void:
	if area.is_in_group("enemy_area"):
		print(area.get_parent().current_health)
		area.get_parent().current_health -= 5
		queue_free()
