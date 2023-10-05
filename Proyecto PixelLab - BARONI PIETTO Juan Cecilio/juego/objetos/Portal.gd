extends Area2D
export var proximo_nivel = ""

var esta_activado = false

func _ready():
	get_parent().connect("abrir_portal",self,"animacion_portal")


func _on_body_entered(body):
	if esta_activado:
		body.entrar_portal(global_position)
		yield(get_tree().create_timer(0.9),"timeout")
		cambiar_nivel()

func cambiar_nivel():
	get_tree().change_scene(proximo_nivel)

func animacion_portal():
	esta_activado = true
	$AnimatedSprite.play("default")
	$AnimationPlayer.play("activado")
