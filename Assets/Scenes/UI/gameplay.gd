extends Node2D

var area_container : Node2D
var player : PlayerController
var hud : HUD

func _ready():
	await get_tree().process_frame
	GameManager.initialize()
	
	hud = get_tree().get_first_node_in_group("hud")
	area_container = get_tree().get_first_node_in_group("area_container")
	player = get_tree().get_first_node_in_group("player")
	
	print(hud)
	print(area_container)
	print(player)
