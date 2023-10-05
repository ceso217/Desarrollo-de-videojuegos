extends KinematicBody2D

export var velocidad = 250.0
export var gravedad = 800.0
var movimiento = Vector2.ZERO

onready var animacion = $AnimationPlayer
onready var detector_vacio = $DetectorDeVacio
onready var detector_pared = $DetectorPared

func _physics_process(_delta):
	caer()
	#rodar()
	move_and_slide(movimiento,Vector2.UP)

func caer():
	if not is_on_floor():
		movimiento.y = gravedad


	
	detectar_colision()
	
	movimiento.x = velocidad

func animar(valor_actual):
	animacion.flip_h = !valor_actual

func detectar_colision():
	if not detector_vacio.is_colliding() or detector_pared.is_colliding():
		velocidad *= -1
		detector_vacio.position.x *= -1
		detector_pared.scale.x *= -1
		detector_pared.position.x *= -1
		if animacion.play("rodarD"):
			animacion.stop("rodarD")
			animacion.play("rodarI")
		if animacion.play("rodarI"):
			animacion.stop("rodarI")
			animacion.play("rodarD")

func _on_Area2D_body_entered(body):
	body.respawn()
