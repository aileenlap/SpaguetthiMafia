extends Control

var selected = false
var global_position
var initial_pos
var offset
var Cardname = 'civilian1'
onready var CardDatabase = preload ('res://CardDatabase.gd')
onready var CardInfo = CardDatabase.DATA[CardDatabase.get(Cardname)]

func _ready():
	initial_pos = rect_position
	var type = str(CardInfo[1])
	var cost = str(CardInfo[2])
	var dmg = str(CardInfo[3])
	var text = str(CardInfo[4])
	$Area2D/MarginContainer/VBoxContainer/Nom.text = Cardname
	$Area2D/Text.text = text
	

func _process(delta):
	if selected:
		followMouse()
		
func followMouse():
	rect_position = get_global_mouse_position() - offset

func _on_Carta_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			#mouse down
			selected = true
			offset = rect_size/2 #rect_position - get_local_mouse_position()
		else:
			#mouse released
			selected = false
			rect_position = initial_pos
			
#func return_card():
	#$Tween.interpolate_property($Carta,'position',$Carta.position,initial_pos,1.0,Tween.TRANS_SINE,Tween.EASE_IN_OUT,1.0)

