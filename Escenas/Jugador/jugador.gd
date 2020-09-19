extends objeto_movil

onready var disparador_laser: Node = $DisparadorLaser

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
	if event.is_action_pressed("ui_disparar_laser"):
		if disparador_laser.get_child_count() > 1:
			disparador_laser.detener_disparo()
		else:
			if tipo_objeto == TipoObjeto.MATERIALIZADO:
				disparador_laser.disparar(
						disparador_laser.TipoLaser.MATERIALIZADO , 
						position , rotation)
			elif tipo_objeto == TipoObjeto.DESMATERIALIZADO:
				disparador_laser.disparar(
						disparador_laser.TipoLaser.DESMATERIALIZADO , 
						position , rotation)


func _cambiar_mascara_colisiones(valor: bool) -> void:
	ray_cast.set_collision_mask_bit(2 , valor)


func _materializar() -> void:
	_cambiar_mascara_colisiones(true)
	material = material_materializado
	tipo_objeto = TipoObjeto.MATERIALIZADO


func _desmaterializar() -> void:
	_cambiar_mascara_colisiones(false)
	material = material_desmaterializar
	tipo_objeto = TipoObjeto.DESMATERIALIZADO



