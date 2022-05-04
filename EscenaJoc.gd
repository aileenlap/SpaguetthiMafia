extends Node2D

const PlayerHand = preload ("res://PlayerHand.gd")
const EscenaCarta = preload("res://Carta.tscn")
const CardSize = Vector2(625,375)
var CarSelected = []
onready var DeckSize = PlayerHand.CardList.size()

onready var CentreCard = get_viewport().size * Vector2(0.45, 1.15)
onready var Hor_rad = get_viewport().size.x*0.45
onready var Ver_rad = get_viewport().size.y*0.4
var angle = deg2rad(90) - 0.5
var OvalAngleVector = Vector2()

func _ready():
	pass 
	
func drawcard():
	var nova_carta = EscenaCarta.instance()
	CarSelected = randi() % DeckSize
	nova_carta.Cardname = PlayerHand.CardList[CarSelected]
	nova_carta.carrega()
	#nova_carta.rect_position = get_global_mouse_position()
	OvalAngleVector = Vector2(Hor_rad * cos(angle), - Ver_rad * sin(angle))
	nova_carta.rect_position = CentreCard + OvalAngleVector - nova_carta.rect_size/2
	get_parent().add_child(nova_carta)
	nova_carta.rect_scale *= CardSize/nova_carta.rect_size
	nova_carta.rect_rotation = (90 - rad2deg(angle))/4
	PlayerHand.CardList.erase(PlayerHand.CardList[CarSelected])
	angle += 0.25
	DeckSize -= 1
	return DeckSize
		
		
		
