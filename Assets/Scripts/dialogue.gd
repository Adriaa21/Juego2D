extends Node

func show_dialogue(dialogue_path: String) -> void:
	var dialogue = load(dialogue_path)

	if dialogue == null:
		push_error("No se ha podido cargar el diálogo: " + dialogue_path)
		return

	DialogueManager.show_dialogue_balloon(dialogue)
