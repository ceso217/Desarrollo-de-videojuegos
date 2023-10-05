extends Node
signal actualizar_datos
signal game_over

var vidas = 3
var llaves = 0
var mon_oro = 0
var mon_pla = 0
var mon_bro = 0
var nivel_actual = ""
var puntaje = 0

func generar_puntaje():
	var val_oro = mon_oro*10
	var val_bro = mon_bro *1
	var val_pla = mon_pla *5
	puntaje = val_bro + val_oro + val_pla
	return puntaje

func reset():
	vidas = 3
	mon_oro = 0
	mon_pla = 0
	mon_bro = 0

func restar_vidas():
	vidas -= 1
	if vidas == 0:
		emit_signal("game_over")
	emit_signal("actualizar_datos")

func restar_llaves():
	llaves -= 1
	emit_signal("actualizar_datos")

func contab_llaves(valor):
	llaves = valor
	emit_signal("actualizar_datos")

func sumer_mon(moneda):
	match moneda:
		"bronce":
			mon_bro += 1
		"plata": 
			mon_pla += 1
		"oro":
			mon_oro +=1
		_:
			print("ERROR")
	emit_signal("actualizar_datos")
