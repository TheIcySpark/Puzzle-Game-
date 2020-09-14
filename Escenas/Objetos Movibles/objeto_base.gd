extends KinematicBody2D
class_name objeto_base

enum TipoObjeto{
	DESMATERIALIZADO_INVOVIL,
	MATERIALIZADO_INMOVIL
	MATERIALIZADO_MOVIL,
	DESMATERIALIZADO_MOVIL,
}

export (TipoObjeto) var tipo_objeto = TipoObjeto.MATERIALIZADO_INMOVIL
