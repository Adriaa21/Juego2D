extends Node

var dialogues_seen: Array[String] = []
var dialogue_active := false

func show_dialogue(dialogue_path: String) -> void:
	print("SHOW DIALOGUE")
	print("PATH: ", dialogue_path)

	if dialogue_path in dialogues_seen:
		print("EL DIÁLOGO YA SE HA MOSTRADO")
		return

	var dialogue = load(dialogue_path)

	print("DIALOGUE: ", dialogue)

	if dialogue == null:
		push_error("No se ha podido cargar el diálogo: " + dialogue_path)
		return

	print("DIÁLOGO CARGADO CORRECTAMENTE")

	dialogues_seen.append(dialogue_path)

	dialogue_active = true

	var player = get_tree().get_first_node_in_group("player") as PlayerController

	if player:
		player.set_physics_process(false)
		player.velocity = Vector2.ZERO

	print("MOSTRANDO DIÁLOGO")

	DialogueManager.show_dialogue_balloon(dialogue)

	print("BALLOON MOSTRADO")

	await DialogueManager.dialogue_ended

	print("DIÁLOGO TERMINADO")

	dialogue_active = false

	if player:
		player.set_physics_process(true)
