extends Node3D

@export var max_health : int = 10
@onready var health_label: Label3D = $HealthLabel

var current_health : int

func _ready() -> void:
	current_health = max_health
	health_label.text = str(current_health)

func take_damage():
	current_health -= 1
	health_label.text = str(current_health)
	print("TOOK DAMAGE!!")
	


#func _on_body_entered(body: Node) -> void:
#	print("COLLISION!!!")
#	if "enemy" in body.get_groups():
#		take_damage()
#		body.set_process(false)
#	else:
#		print("NOT AN ENEMY?!")
