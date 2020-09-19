extends Button

export var menu_ruta: String

func _on_BotonSalir_button_down() -> void:
	get_tree().change_scene(menu_ruta)
