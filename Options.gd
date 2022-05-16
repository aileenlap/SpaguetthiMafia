extends Control

func _ready():
	pass
	
func _physics_process(delta):
	if Input.is_action_just_pressed("prova"):
		get_tree().change_scene("res://Menu.tscn")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menu.tscn")


func _on_HSlider_value_changed(value):
	AudioServer.set_bus_volume_db(1, linear2db(value))
	AudioServer.set_bus_mute(1, value < 0.01)



func _on_HSlider2_value_changed(value):
	AudioServer.set_bus_volume_db(2, linear2db(value))
	AudioServer.set_bus_mute(2, value < 0.01)
