extends Control

var selected = false
var global_position
var initial_pos
var offset
var Cardname
var CardInfo

var type
var cost
var dmg
var text

func _ready():
	initial_pos = rect_position
	
	
func carrega():
	CardInfo = CardDatabase.DATA[Cardname]
	type = CardInfo['tipus']
	cost = CardInfo['cost']
	dmg = CardInfo['mal']
	text = CardInfo['descripcio']
	$CardBase/Area2D/MarginContainer/VBoxContainer/Nom.text = Cardname
	$CardBase/Area2D/Text.text = text
	
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
			offset = rect_size/rect_position - get_local_mouse_position()
		else:
			#mouse released
			selected = false
			rect_position = initial_pos
			
#func return_card():
	#$Tween.interpolate_property($Carta,'position',$Carta.position,initial_pos,1.0,Tween.TRANS_SINE,Tween.EASE_IN_OUT,1.0)

