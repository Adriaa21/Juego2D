extends Area2D

@export var sprite : Sprite2D

var is_open = false

func _ready():
	close()

func open():
	is_open = true
	sprite.region_rect.position.x = 22

func close():
	is_open = false
	sprite.region_rect.position.x = 0

func _on_body_entered(body):
	if is_open && body is PlayerController:
		GameManager.next_area()

func _on_dialogues_collision_shape_body_entered(body: Node2D) -> void:
	DialogueController.show_dialogue("res://Dialogues/D_1-1.dialogue")
