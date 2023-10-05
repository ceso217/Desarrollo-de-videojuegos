extends Area2D

onready var animacion_consumir = $AnimationPlayer
onready var detector_colision = $CollisionShape2D

func _on_body_entered(body):
	animacion_consumir.play("consumir")
	activar_power_up(body)
	detector_colision.set_deferred("disabled",true)

func activar_power_up(body):
	pass
