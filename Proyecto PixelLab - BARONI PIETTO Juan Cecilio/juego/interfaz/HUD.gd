extends Control

onready var etiqueta_vidas = $ContenedorVidas/Label
onready var etq_mon_oro = $ContenedorMonedasOro/Label
onready var etq_mon_pla  = $ContenedorMonedasPlata/Label
onready var etq_mon_bro  = $ContenedorMonedasBronce/Label
onready var etq_llaves = $ContenedorLLaves/Label

func _ready():
	DatosPlayer.connect("actualizar_datos",self,"actualizar_hud")
	actualizar_hud()

func actualizar_hud():
	etiqueta_vidas.text = "%s" %DatosPlayer.vidas
	etq_mon_bro.text = "%s" %DatosPlayer.mon_bro
	etq_mon_oro.text = "%s" %DatosPlayer.mon_oro
	etq_mon_pla.text = "%s" %DatosPlayer.mon_pla
	etq_llaves.text = "%s" %DatosPlayer.llaves
