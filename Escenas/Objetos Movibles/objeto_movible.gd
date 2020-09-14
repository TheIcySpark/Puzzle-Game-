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
			 position + direccion * 128, 0.5 , Tween.TRANS_BACK)
	tween.start()

func _animacion_no_mover(direccion: Vector2) -> void:
	tween.interpolate_property(self , "position" , position - direccion * 32,
			 position, 0.5 , Tween.TRANS_BACK)
	tween.start()

func _celda_obstaculo(direccion: Vector2) -> bool:
	var celda: int  = grid.get_cellv(
			grid.world_to_map(position + direccion * 128) )
	return false

func _reaccion_objeto(objeto: Object) -> bool:
	return true

func _mover(direccion: Vector2) -> bool:
	if _cambio_direccion(direccion):
		return false
	if _celda_obstaculo(direccion):
		_animacion_no_mover(direccion)
		return false
	else:
		var objeto: Object = ray_cast.get_collider()
		
	return true



func _cambio_direccion(direccion: Vector2) -> bool:
	if (Vector2.RIGHT.rotated(rotation) - direccion).length() < 0.1:
		return false
	rotation = direccion.angle()
	return true




