extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 35

func change_health (new_life):
	health = new_life
	$HealthBar._on_health_updated(new_life)
	$AnimatedSprite.play("hurt")
	yield(get_tree().create_timer(0.8), 'timeout')
	$AnimatedSprite.play("idle")
	if self.health == 0:
		$AnimatedSprite.play('die')
		yield(get_tree().create_timer(0.6), "timeout")
		position = Vector2(10000,10000)

func _ready():
	$HealthBar/TextureProgress.max_value = max_health
	$HealthBar/TextureProgress.value = health
	$AnimatedSprite.play("idle")
	yield(get_tree().create_timer(3), 'timeout')
	_attack(5)
#	self.health = 0
	var damages = 0
#	damages.get_node('damage_total').

func _attack(damage):
	$AnimationPlayer.play('attack')
	var damage_total = damage
	return damage_total
