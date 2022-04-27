extends KinematicBody2D

var health = 100 setget change_health
export var max_health = 20

func change_health (new_life):
	health = new_life
	$HealthBar._on_health_updated(new_life)
	$AnimatedSprite.play("hurt")

func _ready():
	$HealthBar/TextureProgress.max_value = max_health
	$HealthBar/TextureProgress.value = health
	yield(get_tree().create_timer(3), 'timeout')
	self.health = 10
