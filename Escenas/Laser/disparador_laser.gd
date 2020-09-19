extends Node

enum TipoLaser{MATERIALIZADO , DESMATERIALIZADO}

export var laser_materializado: PackedScene
export var laser_desmaterializado: PackedScene
var _laser: laser

func disparar(tipo_laser: int , posicion: Vector2, rotacion: float) -> void:
	if tipo_laser == TipoLaser.MATERIALIZADO:
		_laser = laser_materializado.instance()
	elif tipo_laser == TipoLaser.DESMATERIALIZADO:
		_laser = laser_desmaterializado.instance()
	_laser.position = posicion
	_laser.rotation = rotacion
	add_child(_laser)
	_laser.disparar()


func eliminar_invalido(_laser: laser) -> bool:
	var largo = abs((_laser.get_collision_point() - _laser.position).length())
	if _laser.is_colliding() and \
	abs((_laser.get_collision_point() - _laser.position).length()) \
	<=100 :
		_laser.queue_free()
		return true
	return false


func detener_disparo() -> void:
	var i : int = 1
	var lasers: int = get_child_count()
	while i < lasers:
		get_child(i).queue_free()
		i += 1


func _eliminar_reflejos() -> void:
	var i : int = 2
	var reflejos: int = get_child_count()
	while i < reflejos:
		get_child(i).queue_free()
		i += 1



func _on_Timer_timeout() -> void:
	_eliminar_reflejos()
