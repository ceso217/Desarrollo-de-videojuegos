extends Area2D

export var es_trampa = false

onready var detector_jugador = $RayCast2D

var color_trampa = Color.darkseagreen

func _ready():
	if es_trampa:
		$Sprite.modulate = color_trampa
		detector_jugador.enabled = true
		rotation_degrees = 180

func _process(delta):
	if detector_jugador.is_colliding():
		detector_jugador.set_deferred("enabled",false)
		$AnimationPlayer.play("caer")

func _on_Spikes_body_entered(body):
	body.respawn()
