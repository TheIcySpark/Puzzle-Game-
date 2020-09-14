extends objeto_movible

func _ready() -> void:
	ray_cast = $RayCast
	tween = $Tween
	grid = get_parent().get_parent()
