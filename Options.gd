extends Control

func _ready():
	pass
	
func _process(delta):
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

func _safe():
	var doc = File.new()
	var dicti = {}
	doc.open("user://save.dat", File.WRITE)
	for node in get_tree().get_nodes_in_group("safe"):
		dicti[node.get_path()] = node.desa()
	doc.store_string(var2str(dicti))
	doc.close()

func _load():
	var doc = File.new()
	doc.open("user://save.dat", File.READ())
	var dicti = str2var(doc.get_as_text())
	for way in dicti:
		var node = get_node(way)
		for prop in dicti[way]:
			node.set(prop, dicti[way][prop])
	doc.close()
