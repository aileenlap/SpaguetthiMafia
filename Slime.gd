extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 50

func change_health (new_life):
	health = new_life
	$HealthBar._on_health_updated(new_life)
	$AnimatedSprite.play("hurt")
	yield(get_tree().create_timer(0.8), 'timeout')
	$AnimatedSprite.play("idle")
	
func _attack(damage, buff):
	var damage_total = damage + buff
	$AnimationPlayer.play("Nova Animació")
	Global.Slime_sfx.play()
	return damage_total
	
func _defense(defense, buff):
	var defense_total = defense + buff
	$AnimatedSprite.play("defense")
	Global.Protect_sfx.play()
	yield(get_tree().create_timer(1.6), "timeout")
	$AnimatedSprite.play("idle")
	return defense_total

func _ready():
	$HealthBar/TextureProgress.max_value = max_health
	$HealthBar/TextureProgress.value = health
	$AnimatedSprite.play("idle")

func desa():
	var dict = {}
	dict['position'] = position
	dict["health"] = health
	return dict
