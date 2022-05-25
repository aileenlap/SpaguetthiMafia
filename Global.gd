extends Node

var Music1:AudioStreamPlayer
var Music2:AudioStreamPlayer
var musics = [Music1, Music2]

var Goblin_sfx:AudioStreamPlayer
var Skeleton_sfx:AudioStreamPlayer
var Slime_sfx:AudioStreamPlayer
var Eye_sfx:AudioStreamPlayer
var Mushroom_sfx:AudioStreamPlayer
var Protect_sfx:AudioStreamPlayer
var Attack_sfx:AudioStreamPlayer

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
	
	musics = [Music1, Music2]
	
	Goblin_sfx = AudioStreamPlayer.new()
	Goblin_sfx.stream = preload("res://musica/SFX/Goblin.mp3")
	Goblin_sfx.bus = "sfx"
	add_child(Goblin_sfx)
	
	Skeleton_sfx = AudioStreamPlayer.new()
	Skeleton_sfx.stream = preload("res://musica/SFX/Skeleton Hit Bone - QuickSounds.com.mp3")
	Skeleton_sfx.bus = "sfx"
	add_child(Skeleton_sfx)
	
	Slime_sfx = AudioStreamPlayer.new()
	Slime_sfx.stream = preload("res://musica/SFX/Slime.mp3")
	Slime_sfx.bus = "sfx"
	add_child(Slime_sfx)
	
	Protect_sfx = AudioStreamPlayer.new()
	Protect_sfx.stream = preload("res://musica/SFX/Shield.mp3")
	Protect_sfx.bus = "sfx"
	add_child(Protect_sfx)
	
	Attack_sfx = AudioStreamPlayer.new()
	Attack_sfx.stream = preload("res://musica/SFX/Sword.wav")
	Attack_sfx.bus = "sfx"
	add_child(Attack_sfx)
	
	Mushroom_sfx = AudioStreamPlayer.new()
	Mushroom_sfx.stream = preload("res://musica/SFX/mixkit-small-hit-in-a-game-2072.wav")
	Mushroom_sfx.bus = "sfx"
	add_child(Mushroom_sfx)
	
	Eye_sfx = AudioStreamPlayer.new()
	Eye_sfx.stream = preload("res://musica/SFX/mixkit-air-whistle-punch-2048.wav")
	Eye_sfx.bus = "sfx"
	add_child(Eye_sfx)

func change_music(new_music):
	
	var other = (new_music + 1) % 2
	musics[new_music].volume_db = musics[other].volume_db
	musics[other].stop()
	musics[new_music].play()
