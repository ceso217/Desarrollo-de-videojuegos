extends "res://juego/objetos/PowerUpBase.gd"

func activar_power_up(body):
	body.cambiar_fuerza_salto()
