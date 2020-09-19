extends Button

export var nivel_ruta: String

func _ready() -> void:
	connect("button_down", self, "_cambiar_nivel")


func _cambiar_nivel() -> void:
	get_tree().change_scene(nivel_ruta)
