extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$VBoxContainer/Start.grab_focus()


func _on_Start_pressed():
	get_tree().change_scene("res://Joc.tscn")
	
func _on_Options_pressed():
	var options = load("res://Options.tscn").instance()
	get_tree().current_scene.add_child(options)
	
func _on_Exit_pressed():
	get_tree().quit()


func _on_TextureButton_pressed():
	pass # Replace with function body.
