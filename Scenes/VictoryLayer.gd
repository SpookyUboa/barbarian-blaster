extends CanvasLayer

@onready var base: RigidBody3D = $"../Base"
@onready var star_1: TextureRect = %Star1
@onready var star_2: TextureRect = %Star2
@onready var star_3: TextureRect = %Star3
@onready var bank: MarginContainer = %Bank


func victory() -> void:
	visible = true
	star_1.modulate = Color.WHITE
	if(base.current_health == base.max_health):
		star_2.modulate = Color.WHITE
	if(bank.gold >= 500): 
		star_3.modulate = Color.WHITE

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass
