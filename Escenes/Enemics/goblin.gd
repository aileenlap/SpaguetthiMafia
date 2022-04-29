extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 25

func change_health (new_life):
	health = new_life
	$HealthBar._on_health_updated(new_life)
	$AnimatedSprite.play("hurt")
	yield(get_tree().create_timer(0.8), 'timeout')
	$AnimatedSprite.play("idle")

	if health == 0:
		$AnimatedSprite.play("die")
		yield(get_tree().create_timer(0.8888888888888888888888888889), 'timeout')
		position = Vector2(30000, 30000)

func _ready():
	$HealthBar/TextureProgress.max_value = max_health
	$HealthBar/TextureProgress.value = health
	$AnimatedSprite.play("idle")
	yield(get_tree().create_timer(3), 'timeout')
	self.health = 0
