extends Control

onready var health_bar = $HealthBar
onready var update_tween = $UpdateTween

func _on_health_updated(health, amount):
	health_bar.value = health
	update_tween.interpolate_property(health_bar, "vaule", health_bar.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	update_tween.update()
	
func _on_max_healt_updated(max_health):
	health_bar.max_value = max_health
	
