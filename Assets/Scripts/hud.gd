extends Node
class_name HUD

@export var energy_cell_label : Label
@export var portal_label : Label

func update_energy_cell_label(number : int):
	energy_cell_label.text = "x " + str(number)

func portal_opened():
	portal_label.text = "Portal Abierto"

func portal_closed():
	portal_label.text = "Portal Cerrado... Pilla mas cachivaches!!"
