extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 50

func change_health (new_life):
	health = new_life
	$HealthBar._on_health_updated(new_life)
	$AnimatedSprite.play("hurt")
	yield(get_tree().create_timer(0.8), 'timeout')
	$AnimatedSprite.play("idle")
	if health == 0:
		$AnimatedSprite.play("die")
		yield(get_tree().create_timer(0.8888888888888888888888888889), 'timeout')
		visible = false

func _ready():
	$HealthBar/TextureProgress.max_value = max_health
	$HealthBar/TextureProgress.value = health
	$AnimatedSprite.play("idle")
	yield(get_tree().create_timer(3), 'timeout')
	self.health = 0

func _attack(damage, buff):
	$AnimationPlayer.play("Nova Animació")
	var damage_total = damage + buff
	return damage_total
	
func _defense(defense, buff):
	$AnimatedSprite.play("defense")
	var defense_total = defense + buff
	yield(get_tree().create_timer(1.6), "timeout")
	$AnimatedSprite.play("idle")
	return defense_total
