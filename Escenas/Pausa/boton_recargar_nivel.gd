extends Button



func _on_BotonRecargarNivel_button_down() -> void:
	get_tree().reload_current_scene()
