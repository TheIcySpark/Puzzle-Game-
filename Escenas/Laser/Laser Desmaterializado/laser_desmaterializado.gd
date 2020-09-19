extends laser

var objeto_colisionado_anterior: Object = null

func disparar() -> void:
	.disparar()
	var objeto_colisionado: Object = null
	var tipo_objeto_colisionado
	if is_colliding():
		objeto_colisionado = get_collider()
		if objeto_colisionado != objeto_colisionado_anterior and \
		objeto_colisionado is objeto_movil:
			tipo_objeto_colisionado = objeto_colisionado.get("tipo_objeto")
			if tipo_objeto_colisionado == \
			objeto_colisionado.TipoObjeto.MATERIALIZADO:
				objeto_colisionado._desmaterializar()
			elif tipo_objeto_colisionado == \
			objeto_colisionado.TipoObjeto.DESMATERIALIZADO:
				objeto_colisionado._materializar()
	objeto_colisionado_anterior = objeto_colisionado


