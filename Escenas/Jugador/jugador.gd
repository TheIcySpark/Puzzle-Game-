extends objeto_movil
export var material_desmaterializar: Material 

func _unhandled_input(event: InputEvent) -> void:
	if not tween.is_active():
		if event.is_action_pressed("ui_arriba"):
			mover(Vector2.UP)
		elif event.is_action_pressed("ui_derecha"):
			mover(Vector2.RIGHT)
		elif event.is_action_pressed("ui_abajo"):
			mover(Vector2.DOWN)
		elif event.is_action_pressed("ui_izquierda"):
			mover(Vector2.LEFT)

func _cambiar_mascara_colisiones(valor: bool) -> void:
	ray_cast.set_collision_mask_bit(2 , valor)


func _materializar() -> void:
	_cambiar_mascara_colisiones(true)
	material = null


func _desmaterializar() -> void:
	_cambiar_mascara_colisiones(false)
	material = material_desmaterializar



