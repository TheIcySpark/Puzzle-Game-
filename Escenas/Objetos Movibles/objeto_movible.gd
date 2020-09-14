extends objeto_base
class_name objeto_movible

onready var tween: Tween
onready var grid: TileMap
onready var ray_cast: RayCast2D

enum TipoCelda{
	OBSTACULO = 0,
}

func _animacion_mover(direccion: Vector2) -> void:
	tween.interpolate_property(self , "position" , position,
			 position + direccion * 128, 0.15 , Tween.TRANS_BACK)
	tween.start()

func _animacion_no_mover(direccion: Vector2) -> void:
	tween.interpolate_property(self , "position" , position - direccion * 32,
			 position, 0.15 , Tween.TRANS_BACK)
	tween.start()

func _celda_obstaculo(direccion: Vector2) -> bool:
	var celda: int  = grid.get_cellv(
			grid.world_to_map(position + direccion * 128) )
	if celda == TipoCelda.OBSTACULO:
		return true
	else:
		return false

func _reaccion_objeto(objeto: Object , direccion: Vector2) -> bool:
	var tipo_objeto = objeto.get("tipo_objeto")
	if tipo_objeto == TipoObjeto.DESMATERIALIZADO_INVOVIL:
		_animacion_no_mover(direccion)
		return false
	
	elif (tipo_objeto == TipoObjeto.MATERIALIZADO_INMOVIL and
	self.tipo_objeto == TipoObjeto.MATERIALIZADO_MOVIL):
		
		_animacion_no_mover(direccion)
		return false
	
	elif (tipo_objeto == TipoObjeto.MATERIALIZADO_INMOVIL and
	self.tipo_objeto == TipoObjeto.DESMATERIALIZADO_MOVIL):
		
		_animacion_mover(direccion)
		return true
	elif (tipo_objeto == TipoObjeto.MATERIALIZADO_MOVIL and
	self.tipo_objeto == TipoObjeto.MATERIALIZADO_MOVIL):
		
		if objeto._mover(direccion):
			_animacion_mover(direccion)
			return true
		
	elif (tipo_objeto == TipoObjeto.DESMATERIALIZADO_MOVIL and
	self.tipo_objeto == TipoObjeto.DESMATERIALIZADO_MOVIL):
		
		if objeto._mover(direccion):
			_animacion_mover(direccion)
			return true
	
	elif (tipo_objeto == TipoObjeto.DESMATERIALIZADO_MOVIL and
	self.tipo_objeto == TipoObjeto.MATERIALIZADO_MOVIL):
		
		if objeto._mover(direccion):
			_animacion_mover(direccion)
			return true
	
	elif (tipo_objeto == TipoObjeto.MATERIALIZADO_MOVIL and
	self.tipo_objeto == TipoObjeto.DESMATERIALIZADO_MOVIL):
		
		if objeto._mover(direccion):
			_animacion_mover(direccion)
			return true
	_animacion_no_mover(direccion)
	return false

func _mover(direccion: Vector2) -> bool:
	if _cambio_direccion(direccion):
		return false
	if _celda_obstaculo(direccion):
		_animacion_no_mover(direccion)
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




