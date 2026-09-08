extends Area2D

@export var sprite : Sprite2D
@export_file("*.dialogue") var dialogue_path : String

var is_open = false

func _ready():
	close()

func open():
	is_open = true
	sprite.region_rect.position.x = 22

func close():
	is_open = false

func _on_body_entered(body):
	if is_open && body is PlayerController:
		GameManager.next_area()

func _on_dialogues_collision_shape_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		DialogueController.show_dialogue(dialogue_path)
