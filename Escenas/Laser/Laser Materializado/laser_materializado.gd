extends laser

var reflejado : bool = false

func objeto_es_cerradura(objeto: Object) -> void:
	if objeto.has_method("abrir"):
		objeto.abrir()


func disparar() -> void:
	var objeto_colisionado: Object
	.disparar()
	var disparador_laser = get_parent()
	if disparador_laser.eliminar_invalido(self):
		return
	if is_colliding():
		objeto_colisionado = get_collider()
		objeto_es_cerradura(objeto_colisionado)
		if objeto_colisionado is zona_reflejante:
			if not reflejado:
				reflejado = true
				disparador_laser.disparar(
						disparador_laser.TipoLaser.MATERIALIZADO , 
						get_collision_point() - Vector2.UP, 
						rotation + PI / 2)
				disparador_laser.disparar(
						disparador_laser.TipoLaser.MATERIALIZADO , 
						get_collision_point() - Vector2.DOWN, 
						rotation + PI / 2)
				
				disparador_laser.disparar(
						disparador_laser.TipoLaser.MATERIALIZADO , 
						get_collision_point() - Vector2.UP, 
						rotation - PI / 2)
				disparador_laser.disparar(
						disparador_laser.TipoLaser.MATERIALIZADO , 
						get_collision_point() - Vector2.DOWN, 
						rotation - PI / 2)
		else:
			reflejado = false





func _on_Timer_timeout() -> void:
	reflejado = false
