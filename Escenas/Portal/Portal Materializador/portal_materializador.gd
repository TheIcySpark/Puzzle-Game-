extends portal


func _on_PortalMaterializador_body_entered(body: Node) -> void:
	if body.has_method("_materializar"):
		body._materializar()
		for linea in _lineas:
			linea.material = material_materializado
