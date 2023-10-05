extends Area2D
signal consumida()

func _on_ZanahoriaLLave_body_entered(body):
	DatosPlayer.restar_llaves()
	emit_signal("consumida")
	$CollisionShape2D.set_deferred("disabled",true)
	$AnimationPlayer.play("consumir")
