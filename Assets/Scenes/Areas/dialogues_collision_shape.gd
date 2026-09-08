extends Area2D

@export_file("*.dialogue") var dialogue_path : String

func _on_body_entered(body: Node2D) -> void:
	print("ENTRÓ AL ÁREA")
	print(body)

	if body is PlayerController:
		print("ES EL PLAYER")
		print(dialogue_path)
		DialogueController.show_dialogue(dialogue_path)
