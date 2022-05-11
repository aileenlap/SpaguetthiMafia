extends Control

func _on_health_updated(health):
	print('Canvia de %d a %d' % [$TextureProgress.value, health])
	$UpdateTween.interpolate_property($TextureProgress, 'value', $TextureProgress.value, health, 0.4, Tween.TRANS_SINE, Tween.EASE_IN_OUT, 0.4)
	$UpdateTween.start()
