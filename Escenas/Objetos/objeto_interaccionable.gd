class_name objeto_interaccionable
extends KinematicBody2D

enum TipoObjeto{
	MATERIALIZADO,
	DESMATERIALIZADO
}

export (TipoObjeto) var tipo_objeto = TipoObjeto.MATERIALIZADO



func _materializar() -> void:
	pass

func _desmaterializar() -> void:
	pass
