extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 50

func change_health (new_life):
	health = new_life
	$HealthBar._on_health_updated(new_life)
	$AnimatedSprite.play("hurt")
	yield(get_tree().create_timer(0.8), 'timeout')
	$AnimatedSprite.play("idle")
	if self.health == 0:
		$AnimatedSprite.play('die')
		yield(get_tree().create_timer(1.2), "timeout")
		position = Vector2(100000,100000)

func _ready():
#	$HealthBar/TextureProgress.max_value = max_health
#	$HealthBar/TextureProgress.value = health
#	$AnimatedSprite.play("idle")
#	yield(get_tree().create_timer(3), 'timeout')
#	_attack(10, 2)
#	var attack = randi
#	self.health = 40
	pass
	
func _attack(damage, buff):
	$AnimationPlayer.play("attack")
	var damage_total = damage + buff
	return damage_total
	
func _attack2(damage, buff):
	$AnimationPlayer.play("attack2")
	var damage_total = damage + buff
	return damage_total
	
func _attack3(damage, buff):
	$AnimationPlayer.play("attack3")
	var damage_total = damage + buff
	return damage_total
