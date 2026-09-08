extends Area2D

@export_file("*.dialogue") var dialogue_path : String

func _on_body_entered(body: Node2D) -> void:
	if body is PlayerController:
		DialogueController.show_dialogue(dialogue_path)
