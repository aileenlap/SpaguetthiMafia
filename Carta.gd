extends Control

var mouse_over = false
var mouse_clicked = false
var node_dragged = false
var is_draggable = false
var last_node_dragged = false

var is_unplacable = false
var over_place = false
var node_placed_in = null
var mouse_pos_distance

onready var main = get_tree().get_current_scene()

func _process(delta):
	if ! node_placed_in:
		if Input.is_action_pressed("click"):
			if !mouse_clicked && mouse_over:
				node_dragged = true
				mouse_pos_distance = get_viewport().get_mouse_position() - self.global_position
			mouse_clicked = true
		else:
			mouse_clicked = false
			node_dragged = false
			
		if node_dragged && is_draggable:
			main.drag_node(self)
			if $s_shadow.position.x < 20:
				$s_shadow.position = Vector2($s_shadow.position.x +3,$s_shadow.position.y +3)
			self.position = Vector2(self.position.x - 2,self.position.y - 2)
			$Tween.interpolate_property(self,"position",self.position,get_viewport().get_mouse_position() - mouse_pos_distance,0.1,Tween.TRANS_SINE,Tween.EASE_OUT)
			$Tween.start()
			last_node_dragged = true

func _on_area_mouse_entered():
	mouse_over = true
	main._add_sprite(self)

func _on_area_mouse_exited():
	mouse_over = false
	main._remove_sprite(self)
