extends portal


func _on_PortalDesmaterializador_body_entered(body: Node) -> void:
	if body.has_method("_desmaterializar"):
		body._desmaterializar()
		for linea in _lineas:
			linea.material = material_desmaterializado
