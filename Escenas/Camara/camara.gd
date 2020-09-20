extends Camera2D

onready var tween: Tween = $Tween

export var movimiento_x: int
export var movimiento_y: int

func _mover_camara(direccion: Vector2) -> void:
	if direccion.x != 0:
		tween.interpolate_property(self, "position", position, 
				position + direccion * movimiento_x , 0.1 , Tween.TRANS_LINEAR)
		tween.start()
	elif direccion.y != 0:
		tween.interpolate_property(self, "position", position, 
				position + direccion * movimiento_y , 0.1 , Tween.TRANS_LINEAR)
		tween.start()


func _on_AreaArriba_body_entered(body: Node) -> void:
	_mover_camara(Vector2.UP)


func _on_AreaAbajo_body_entered(body: Node) -> void:
	_mover_camara(Vector2.DOWN)


func _on_AreaDerecha_body_entered(body: Node) -> void:
	_mover_camara(Vector2.RIGHT)


func _on_AreaIzquierda_body_entered(body: Node) -> void:
	_mover_camara(Vector2.LEFT)
