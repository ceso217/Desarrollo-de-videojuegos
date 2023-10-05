extends Control

func _ready():
	$PanelPuntaje/Label.text = "puntaje: %s" %DatosPlayer.generar_puntaje()



func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")
