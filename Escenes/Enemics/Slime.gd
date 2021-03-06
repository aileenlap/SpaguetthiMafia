extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 35 setget change_max
signal atac(damage_totals)

func change_max(new_max):
	if health > new_max:
		health = new_max
	max_health = new_max
	$HealthBar/TextureProgress.max_value = max_health
	
func change_health (new_life): 
	yield(get_tree().create_timer(1.5), 'timeout')
	if new_life < health:
		$AnimatedSprite.play("hurt")
	$HealthBar._on_health_updated(new_life)
	yield(get_tree().create_timer(0.8), 'timeout')
	$AnimatedSprite.play("idle")
	health = new_life
	if self.health == 0:
		$AnimatedSprite.play('die')
		yield(get_tree().create_timer(0.6), "timeout")
		position = Vector2(10000,10000)

func _ready():
	change_max(max_health)
	change_health(health)
	$AnimatedSprite.play("idle")
	yield(get_tree().create_timer(3), 'timeout')
#	_attack(5)
#	_defense(2,3)

func _attack(damage):
	$AnimationPlayer.play('attack')
	var damage_totals = damage
	emit_signal("atac", damage_totals)
	return damage_totals

func _defense(defense, buff):
	$AnimatedSprite.play('defense')
	var defense_total = defense + buff
	yield(get_tree().create_timer(1.6), "timeout")
	$AnimatedSprite.play('idle')
	return defense_total

func _on_Personatge_atac(damage_totalp, defense_total):
	if defense_total > 0:
		self.health = health - (damage_totalp - defense_total)
	else:
		self.health = health - damage_totalp
