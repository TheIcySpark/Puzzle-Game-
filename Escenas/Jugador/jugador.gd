extends objeto_movible

func _ready() -> void:
	tween = $Tween
	grid = get_parent()
	ray_cast = $RayCast


func _unhandled_input(event: InputEvent) -> void:
	if not tween.is_active():
		if event.is_action_pressed("ui_arriba"):
			_mover(Vector2.UP)
		elif event.is_action_pressed("ui_derecha"):
			_mover(Vector2.RIGHT)
		elif event.is_action_pressed("ui_abajo"):
			_mover(Vector2.DOWN)
		elif event.is_action_pressed("ui_izquierda"):
			_mover(Vector2.LEFT)







