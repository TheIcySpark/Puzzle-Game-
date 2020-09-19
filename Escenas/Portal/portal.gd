class_name portal
extends Area2D

export var lineas_ruta: NodePath
export var material_desmaterializado: Material
export var material_materializado: Material


var _lineas: Array

func _ready() -> void:
	$Sprite/Animacion.play("Rotacion")
	_lineas = get_node(lineas_ruta).get_children()
