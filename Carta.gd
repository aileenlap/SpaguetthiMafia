extends Control

var selected = false
var global_position
var initial_pos = rect_position


func _process(delta):
	if selected:
		followMouse()
		
func followMouse():
	rect_position = get_global_mouse_position() - rect_size/2

func _on_Carta_gui_input(event):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT:
		if event.pressed:
			#mouse down
			selected = true
		else:
			#mouse released
			selected = false
			rect_position = initial_pos
