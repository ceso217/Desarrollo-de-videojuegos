extends Area2D

export(String, "oro","plata","bronce") var tipo_moneda
onready var animacion = $AnimatedSprite
onready var anim_consumir = $Consumir_moneda
onready var colision = $CollisionShape2D

func _ready():
	animacion.play()

func _on_body_entered(body):
	DatosPlayer.sumer_mon(tipo_moneda)
	colision.set_deferred("disabled",true)
	anim_consumir.play("consumir")
