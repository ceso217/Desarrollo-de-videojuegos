extends KinematicBody2D

export var velocidad = Vector2(450.0,1400.0)
export var acel_caida = 130
export var fuerza_salto = 1900
export var fuerza_rebote = 180
export var impulso = -2500
export var acel_caida_vuelo = 60
export var fuerza_dash = 3000

var movimiento = Vector2.ZERO
var fuerza_salto_original
var acel_caida_orig
var puede_moverse = true

onready var animacion = $Animacion
onready var animacion_player = $AnimationPlayer
onready var audio_salto = $AudioSalto
onready var camara = $Camera2D
onready var duracion_power_up_salto = $DuracionPowerUpSalto
onready var duracion_power_up_volar = $DuracionPowerUpVolar

func _ready():
	animacion_player.play("aclarecer")
	fuerza_salto_original = fuerza_salto
	acel_caida_orig = acel_caida

func _physics_process(_delta):
	movimiento.x = velocidad.x * tomar_direccion()
	
	caer()
	saltar()
	dash()
	rebotar()
	caida_al_vacio()
	
	move_and_slide(movimiento,Vector2.UP)

func tomar_direccion():
	var direccion = 0
	if puede_moverse:
		direccion = Input.get_action_strength("mov_derecha")-Input.get_action_strength("mov_izquierda")
	if direccion == 0:
		animacion.play("idle")
	else:
		if direccion<0:
			animacion.flip_h = true
		else:
			animacion.flip_h = false
		animacion.play("caminar")
	
	return direccion
	
func caer():
	if not is_on_floor():
		animacion.play("saltar")
		movimiento.y += acel_caida
		movimiento.y = clamp(movimiento.y,impulso,velocidad.y)

func dash():
	var direccion = 0
	if puede_moverse:
		direccion = Input.get_action_strength("mov_derecha")-Input.get_action_strength("mov_izquierda")
	if Input.is_action_just_pressed("dash") and puede_moverse and direccion!=0:
		if direccion<0:
			animacion_player.play("dashI")
			movimiento.x -= fuerza_dash
		else:
			animacion_player.play("dashD")
			movimiento.x += fuerza_dash

func saltar():
	if Input.is_action_just_pressed("jump") and is_on_floor() and puede_moverse:
		animacion.play("saltar")
		audio_salto.play()
		movimiento_salto()

func movimiento_salto():
	movimiento.y = 0
	movimiento.y -= fuerza_salto

func rebotar():
	if is_on_ceiling():
		movimiento.y = fuerza_rebote

func respawn():
	DatosPlayer.restar_vidas()
	animacion_player.play("oscurecer")
	if DatosPlayer.vidas != 0:
		get_tree().reload_current_scene()

func caida_al_vacio():
	if position.y>camara.limit_bottom:
		respawn()

func cambiar_fuerza_salto():
	duracion_power_up_salto.start()
	fuerza_salto = -impulso * 0.9

func volar():
	duracion_power_up_volar.start()
	acel_caida = acel_caida_vuelo
	animacion_player.play("volar")
	movimiento_salto()

func impulsar():
	movimiento.y = impulso

func _on_DuracionPowerUp_timeout():
	fuerza_salto = fuerza_salto_original


func _on_DuracionPowerUpVolar_timeout():
	animacion_player.play("default")
	acel_caida = acel_caida_orig

func entrar_portal(posicion_portal):
	puede_moverse = false
	animacion_player.play("entrar_portal")
	$Tween.interpolate_property(
		self,
		"global_position",
		global_position,
		posicion_portal,
		0.8,
		Tween.TRANS_LINEAR,
		Tween.EASE_IN_OUT
	)
	$Tween.start()


func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "entrar_portal":
		animacion_player.play("oscurecer")
