extends Control


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass

func _on_Start_pressed():
	get_tree().change_scene("res://Joc.tscn")
	
func _on_Options_pressed():
	get_tree().change_scene("res://Options.tscn")
	
func _on_Exit_pressed():
	get_tree().quit()
