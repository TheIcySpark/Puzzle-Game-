class_name objeto_movil
extends objeto_interaccionable

onready var tween: Tween = $Tween
onready var ray_cast: RayCast2D = $RayCast

func mover(direccion: Vector2) -> bool:
	if _cambio_direccion(direccion):
		return false
	else:
		var objeto: Object = ray_cast.get_collider()
		if objeto == null:
			_animacion_mover(direccion)
			return true
		else:
			return _reaccion_objeto(objeto , direccion)
	return false


func _cambio_direccion(direccion: Vector2) -> bool:
	if (Vector2.RIGHT.rotated(rotation) - direccion).length() < 0.1:
		return false
	rotation = direccion.angle()
	return true


func _animacion_mover(direccion: Vector2) -> void:
	tween.interpolate_property(self , "position" , position,
			 position + direccion * 128, 0.15 , Tween.TRANS_BACK)
	tween.start()


func _animacion_no_mover(direccion: Vector2) -> void:
	tween.interpolate_property(self , "position" , position - direccion * 32,
			 position, 0.15 , Tween.TRANS_BACK)
	tween.start()


func _reaccion_objeto(objeto: Object , direccion: Vector2) -> bool:
	if objeto.has_method("mover"):
		if objeto.mover(direccion):
			_animacion_mover(direccion)
			return true
		else:
			_animacion_no_mover(direccion)
			return false
	else:
		_animacion_no_mover(direccion)
		return false





