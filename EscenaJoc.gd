extends Node2D

const PlayerHand = preload ("res://PlayerHand.gd")
const EscenaCarta = preload("res://Carta.tscn")
const CardSize = Vector2(625,375)
var CarSelected = []
onready var DeckSize = PlayerHand.CardList.size()

func _ready():
	pass 
	
func drawcard():
	var nova_carta = EscenaCarta.instance()
	CarSelected = randi() % DeckSize
	nova_carta.Cardname = PlayerHand.CardList[CarSelected]
	nova_carta.carrega()
	nova_carta.rect_position = get_global_mouse_position()
	get_parent().add_child(nova_carta)
	nova_carta.rect_scale *= CardSize/nova_carta.rect_size
	PlayerHand.CardList.erase(PlayerHand.CardList[CarSelected])
	DeckSize -= 1
	return DeckSize
		
		
		
