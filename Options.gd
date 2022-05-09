extends Control

func _ready():
	pass
func _physics_process(delta):
	if Input.is_action_just_pressed("prova"):
		get_tree().change_scene("res://Menu.tscn")


func _on_TextureButton_pressed():
	get_tree().change_scene("res://Menu.tscn")
