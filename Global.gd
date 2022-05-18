extends Node

var Music1:AudioStreamPlayer
var Music2:AudioStreamPlayer

var Musiques = [Music1, Music2]
func _ready():
	Music1 = AudioStreamPlayer.new()
	Music1.stream = preload("res://musica/bensound-epic.mp3")
	Music1.bus = 'bgm'
	add_child(Music1)
	
	Music2 = AudioStreamPlayer.new()
	Music2.stream = preload("res://musica/alex-productions-epic-cinematic-trailer-elite.mp3")
	Music2.bus = "bgm"
	add_child(Music2)
	
	Music1.play()
	Music1.volume_db = 1

func canvia_musica(nova_musica):
	
	var altra = (nova_musica + 1) % 2
	Musiques[nova_musica].volume_db = Musiques[altra].volume_db
	Musiques[altra].stop()
	Musiques[nova_musica].play()
