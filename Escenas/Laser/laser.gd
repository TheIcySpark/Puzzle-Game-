class_name laser
extends RayCast2D

onready var particulas_inicio: Particles2D = $ParticulasInicio
onready var particulas_fin: Particles2D = $ParticulasFin
onready var linea: Line2D = $Linea
var disparado: bool = false


func disparar() -> void:
	disparado = true
	var punto_choque: Vector2 = cast_to
	force_raycast_update()
	if is_colliding():
		punto_choque = to_local(get_collision_point())
	particulas_fin.position = punto_choque
	linea.points[1] = punto_choque

func _reaccionar_objeto() -> void:
	pass


func _process(delta: float) -> void:
	if disparado:
		disparar()


