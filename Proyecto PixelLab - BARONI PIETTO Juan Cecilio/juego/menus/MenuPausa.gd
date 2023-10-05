extends Control


func _ready():
	visible = false

func _input(event):
	if event.is_action_pressed("pausa"):
		visible = not visible
		get_tree().paused = not get_tree().paused

func _on_BotonMenuPrincipal_pressed():
	get_tree().change_scene("res://juego/menus/MenuPrincipal.tscn")

func _on_ButtonContinuar_pressed():
	visible = false
	get_tree().paused = false



