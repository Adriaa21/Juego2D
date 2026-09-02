extends Node

var starting_area = 1
var current_area = 1
var area_path = "res://Assets/Scenes/Areas/"

var energy_cells = 0
var area_container : Node2D
var player : PlayerController
var hud : HUD

func _ready():
	pass

func initialize():
	hud = get_tree().get_first_node_in_group("hud")
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")

	current_area = starting_area
	load_area(current_area)
	reset_energy_cells()

func next_area():
	current_area += 1
	load_area(current_area)

func load_area(area_number):
	var full_path = area_path + "area_" + str(area_number) + ".tscn"

	var scene = load(full_path) as PackedScene
	if !scene:
		push_error("ERROR EN CARGAR ESCENAS")
		return

	for child in area_container.get_children():
		child.queue_free()
		await child.tree_exited

	var instance = scene.instantiate()
	area_container.add_child(instance)

	reset_energy_cells()

	var player_start_position = get_tree().get_first_node_in_group("player_start_position") as Node2D
	if player_start_position:
		player.teleport_to_location(player_start_position.position)

func add_energy_cell():
	energy_cells += 1
	hud.update_energy_cell_label(energy_cells)

	if energy_cells >= 4:
		var portal = get_tree().get_first_node_in_group("area_exits")
		if portal:
			portal.open()
			hud.portal_opened()

func reset_energy_cells():
	energy_cells = 0
	hud.update_energy_cell_label(energy_cells)
	hud.portal_closed()
