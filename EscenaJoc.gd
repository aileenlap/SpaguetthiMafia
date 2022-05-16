extends Node2D

const PlayerHand = preload ("res://PlayerHand.gd")
const EscenaCarta = preload("res://Carta.tscn")
const CardSize = Vector2(125,175)
var CarSelected = []
onready var DeckSize = PlayerHand.CardList.size()

onready var CentreCard = get_viewport().size * Vector2(0.45, 1.15)
onready var Hor_rad = get_viewport().size.x*0.45
onready var Ver_rad = get_viewport().size.y*0.4
var angle = 0
var CardSpread = 0.25
var Card_numb = 0
var NumberCardsHand = 0
var OvalAngleVector = Vector2()

enum{
	InHand
	InPlay
	InMouse
	FocusInHand
	MoveDrawnCardToHand
	ReOrganiseHand
}

func _ready():
	pass 
	
func drawcard():
	angle = PI/2 + CardSpread*(float(NumberCardsHand)/2 - NumberCardsHand)
	var nova_carta = EscenaCarta.instance()
	CarSelected = randi() % DeckSize
	nova_carta.Cardname = PlayerHand.CardList[CarSelected]
	nova_carta.carrega()
	#nova_carta.rect_position = get_global_mouse_position()
	OvalAngleVector = Vector2(Hor_rad * cos(angle), - Ver_rad * sin(angle))
	nova_carta.startpos = $Deck.position - CardSize/2
	nova_carta.targetpos = CentreCard + OvalAngleVector - nova_carta.rect_size
	nova_carta.startrot = 0
	nova_carta.targetrot = (90 - rad2deg(angle))/4
	get_parent().add_child(nova_carta)
	nova_carta.rect_scale *= CardSize/nova_carta.rect_size
	nova_carta.state = MoveDrawnCardToHand
	Card_numb = 0
	for karta in $Carta.get_children():
		angle = PI/2 + CardSpread*(float(NumberCardsHand)/2 - Card_numb)
		OvalAngleVector = Vector2(Hor_rad * cos(angle), - Ver_rad * sin(angle))
		nova_carta.startpos = $Deck.position - CardSize/2
		nova_carta.targetpos = CentreCard + OvalAngleVector - nova_carta.rect_size
		nova_carta.startrot = 0
		nova_carta.targetrot = (90 - rad2deg(angle))/4
		karta.state = ReOrganiseHand
	PlayerHand.CardList.erase(PlayerHand.CardList[CarSelected])
	angle += 0.25
	DeckSize -= 1
	NumberCardsHand += 1
	Card_numb += 1
	return DeckSize
		
		
		
