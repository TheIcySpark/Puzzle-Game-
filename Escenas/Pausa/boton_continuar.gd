extends Button

export var pausa_ruta: NodePath


func _on_BotonContinuar_button_down() -> void:
	get_node(pausa_ruta).visible = false
