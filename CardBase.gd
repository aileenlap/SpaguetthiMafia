extends MarginContainer

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

func _ready():
	pass # Replace with function body.

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
				t += delta/float(drawtime)
			else:
				rect_position = targetpos
				state = InHand
				t = 0
			
		ReOrganiseHand:
			pass
			
			
