extends Node2D

const PlayerHand = preload ("res://PlayerHand.gd")
const EscenaCarta = preload("res://Carta.tscn")

func _ready():
	pass 
	
func _input(event):
	if Input.is_action_just_pressed("click"):
		var nova_carta = EscenaCarta.instance()
		nova_carta.Cardname = 'civilian2'
		nova_carta.carrega()
		nova_carta.rect_position = get_global_mouse_position()
		get_parent().add_child(nova_carta)
		
