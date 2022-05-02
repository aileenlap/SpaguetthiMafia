extends TextureButton

var DeckSize = INF

func _ready():
	rect_scale *= $'../../'.CardSize/rect_size
	
func _gui_input(event):
	if Input.is_action_just_released("click"):
		if DeckSize > 0:
			DeckSize = $'../../'.drawcard()
			if DeckSize == 0:
				disabled = true 
