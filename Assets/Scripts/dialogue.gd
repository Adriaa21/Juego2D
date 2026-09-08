extends Node

var dialogues_seen: Array[String] = []

func show_dialogue(dialogue_path: String) -> void:
	if dialogue_path in dialogues_seen:
		return

	dialogues_seen.append(dialogue_path)

	var player = get_tree().get_first_node_in_group("player")
	player.set_physics_process(false)

	DialogueManager.show_dialogue_balloon(load(dialogue_path))

	await DialogueManager.dialogue_ended

	player.set_physics_process(true)
