extends Control

enum{
	InHand
	InPlay
	InMouse
	FocusInHand
	MoveDrawnCardToHand
	ReOrganiseHand
}

var state = InHand
var startpos = 0
var targetpos = 0
var t = 0
var drawtime = 1
var startrot = 0
var targetrot = 0
var Orig_scale = rect_scale.x

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
	var CardSize = rect_size
	CardInfo = CardDatabase.DATA[Cardname]
	type = CardInfo['tipus']
	cost = CardInfo['cost']
	dmg = CardInfo['mal']
	text = CardInfo['descripcio']
	$CardBase/Area2D/MarginContainer/VBoxContainer/Nom.text = Cardname
	$CardBase/Area2D/Text.text = text
	$Card.scale *= CardSize/$Card.texture.get_size()
	$CardBack.scale *= CardSize/$CardBack.texture.get_size()
	
	
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
			
func _physics_process(delta):
	match state:
		InHand:
			pass
			
		InPlay:
			pass
			
		InMouse:
			pass
			
		FocusInHand:
			pass
			
		MoveDrawnCardToHand:
			if t <= 1:
				rect_position = startpos.linear_interpolate(targetpos, t)
				rect_rotation = startrot * (1-t) + targetrot * t
				rect_scale.x = Orig_scale * abs(2-t - 1)
				if $CardBack.visible:
					if t >= false:
						$CardBack.visible = false
				t += delta/float(drawtime)
			else:
				rect_position = targetpos
				rect_rotation = targetrot
				state = InHand
				t = 0
			
		ReOrganiseHand:
			if t <= 1:
				rect_position = startpos.linear_interpolate(targetpos, t)
				rect_rotation = startrot * (1-t) + targetrot * t
				t += delta/float(drawtime)
			else:
				rect_position = targetpos
				rect_rotation = targetrot
				state = InHand
				t = 0
			
			
