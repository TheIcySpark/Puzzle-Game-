extends objeto_movil

onready var zona_reflenate: Area2D = $ZonaReflejante

func mover(direccion: Vector2 ,
tipo_objeto_empuje: int = tipo_objeto) -> bool:
	if tipo_objeto != tipo_objeto_empuje:
		_animacion_no_mover(direccion)
		return false
	else:
		return .mover(direccion)

func _materializar() -> void:
	tipo_objeto = TipoObjeto.MATERIALIZADO
	material = material_materializado
	zona_reflenate.set_collision_layer_bit(3, true)


func _desmaterializar() -> void:
	tipo_objeto = TipoObjeto.DESMATERIALIZADO
	material = material_desmaterializar
	zona_reflenate.set_collision_layer_bit(3, false)




