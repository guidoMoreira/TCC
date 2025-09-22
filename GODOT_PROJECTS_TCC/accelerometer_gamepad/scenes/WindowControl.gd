extends Control

"""Telas"""
onready var scr_MainMenu = $MainMenu
onready var scr_Menu = $Menu
onready var scr_Calibracao = $TelaLimiteHardware
onready var scr_MaoSuporte =  $TelaMaoSuporte
#onready var scr_EscolherMao = $EscolherMao
#onready var scr_ServidoresDisponiveis = $AvaiableServers
onready var scr_RunningGame = $RunningGame
onready var scr_Conectar = $TelaConectar

var scr_atual = 0


func _ready():
	for f in get_children():
		f.visible = false
	scr_MainMenu.visible = true

"""Checando Comandos Celular"""
func _notification(what):
		#print(NOTIFICATION_WM_GO_BACK_REQUEST)
	if what == NOTIFICATION_WM_GO_BACK_REQUEST:
		match scr_atual:
			0: # main menu
				get_tree().quit()
"""
			1: # 
				
			2: #
				
			3: #
				
			4: #
			
"""
func _process(delta):
	if scr_atual == 3:
		$TelaLimiteHardware/Seta.rotation = PI/2*get_parent().acval/10
		
"""MAIN MENU 0"""
func MenuConectar():
	scr_atual = 1
	scr_MainMenu.visible = false
	scr_Conectar.visible = true
func MenuCalibrar():
	scr_atual = 3
	scr_MainMenu.visible = false
	scr_Menu.visible = true

func SairApp():
	get_tree().quit()
	
"""Conectar 1"""
#No codigo do gamepad

"""Running Game 2"""


#"""Escolher Mao"""
#func EscolhidaMao():
#	scr_EscolherMao.visible = false
#	scr_Calibracao.visible = true

"""Menu Calibrar 3"""
func btJogar(): # Remover?
	pass
	#scr_Menu.visible = false
func Calibrar():
	scr_atual = 5
	scr_Menu.visible = false
	scr_Calibracao.visible = true
func reMao():
	scr_atual = 6
	scr_Menu.visible = false
	scr_MaoSuporte.visible = true
func MainMenuVoltar():
	scr_atual = 0
	scr_Menu.visible = false
	scr_MainMenu.visible = true
"""Calibrar Limite Hardware 5"""
func _on_bt_voltar_calib_hard_pressed():
	scr_atual = 3
	scr_Menu.visible = true
	scr_Calibracao.visible = false
	get_parent().minimo = float($TelaLimiteHardware/lb_ang_min/LE_Min.text)
	get_parent().maximo = float($TelaLimiteHardware/lb_ang_max/LE_Max.text)
	get_parent().new_max_min = true

"""Controle Mao ou Suporte 6"""
func _on_bt_voltar_MaoSup_pressed():
	scr_atual = 3
	scr_Menu.visible = true
	scr_MaoSuporte.visible = false



