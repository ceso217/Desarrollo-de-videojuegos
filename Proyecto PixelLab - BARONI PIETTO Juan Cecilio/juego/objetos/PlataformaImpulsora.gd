extends Area2D

onready var animacion = $AnimationPlayer

func _ready():
	animacion.play("Idle")
	
func _on_body_entered(body):
	animacion.play("impulsar")
	body.impulsar()
