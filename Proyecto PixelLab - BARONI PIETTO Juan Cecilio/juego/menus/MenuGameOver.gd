extends Control

var nivel_actual = ""

func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")

func _ready():
	DatosPlayer.reset()
	nivel_actual = DatosPlayer.nivel_actual

func _on_ButtonReintentar_pressed():
	get_tree().change_scene(nivel_actual)
