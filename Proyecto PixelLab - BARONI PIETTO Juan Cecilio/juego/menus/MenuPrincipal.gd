extends Control

export var nivel_uno = "res://juego/niveles/Nivel 1.tscn"

func _on_ButtonIniciarJuego_pressed():
	MusicaGlobal.replay()
	get_tree().change_scene(nivel_uno)

#hay un bug que cuando voy al menu principal desde el menu de pausa este no funciona
#pero la escena en sí, si funciona, y también funciona cuando voy 
#desde el menu game over o desde el de victoria, no sé porque qué es :(
