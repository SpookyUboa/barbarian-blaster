extends Node3D

@export var max_health : int = 10
@export var defeat_layer : CanvasLayer
@export var defeat_message : Label
@onready var health_label: Label3D = $HealthLabel

var current_health : int:
	set(health_in):
		current_health = max(0, health_in)
		health_label.text = str(current_health) + "/" + str(max_health)
		var red: Color = Color.RED
		var white: Color = Color.WHITE
		var blended_color = red.lerp(white,float(current_health) / float(max_health))
		health_label.modulate = blended_color
		if current_health < 1:
			defeat_message.text = "DEFEAT"
			defeat_layer.show()

func _ready() -> void:
	current_health = max_health
	health_label.text = str(current_health) + "/" + str(max_health)

func take_damage():
	current_health -= 1
