extends Area2D

onready var colision_danio = $ColisionDanio
onready var colision_impulso = $ColisionImpulso/CollisionShape2D
onready var animacion = $AnimationPlayer

func desactivador_colisionadores(colisionadores):
	for colision in colisionadores:
		colision.set_deferred("disabled",true)

func _on_ColisionImpulso_body_entered(body):
	desactivador_colisionadores([colision_danio,colision_impulso])
	body.impulsar()
	animacion.stop()
	animacion.play("morir")

func _on_Volon_body_entered(body):
	body.respawn()
