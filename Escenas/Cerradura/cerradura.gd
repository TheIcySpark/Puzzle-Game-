extends objeto_interaccionable

export var siguiente_escena: String

func abrir() -> void:
	yield(get_tree().create_timer(0.5), "timeout")
	get_tree().change_scene(siguiente_escena)

