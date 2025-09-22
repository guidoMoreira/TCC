extends Control

onready var original_position = $WindowControl/RunningGame/Label/circle_bubble_inner.position

const GRAVITY: float = 9.8
const OFFSET_MAX: float = 620.0

onready var ws = $WSClient
onready var prtlb = $WindowControl/RunningGame/ColorRect/PRINTLB

var suporte_ou_mao = 0

var new_max_min = false
var minimo = -9.7
var maximo = 9.7

var acval = 0




func _process(delta):
	var accel = Input.get_accelerometer()
	prtlb.text = str(accel)
	
	if suporte_ou_mao == 0:
		acval = accel.x
	elif suporte_ou_mao == 1:
		acval = accel.z

	$WindowControl/RunningGame/Label/circle_bubble_inner.position.x = 700 + ((acval)/ GRAVITY * OFFSET_MAX)
	var data = {}
	if !new_max_min:
		data = {"accel": acval}
	else:
		new_max_min = false
		data = {"accel": acval,"min":minimo,"max":maximo}
	ws.send_data(JSON.print(data))

func connect_ws(): 
	ws.connect_ws("ws://" + $WindowControl/TelaConectar/Control/VBoxContainer/TextEdit.text + ":9080")

func _on_ConnectBtn_pressed():
	print("Connecting..")
	connect_ws()



func _on_WSClient_connected(to_url):
	$WindowControl/RunningGame/MarginContainer/HBoxContainer/ServerIP.text = to_url
	$WindowControl/RunningGame/MarginContainer/HBoxContainer/Status.text = "CONNECTED"
	$WindowControl.scr_atual = 2
	$WindowControl/TelaConectar.visible = false
	$WindowControl/RunningGame.visible = true

func _on_WSClient_disconnected():
	$WindowControl/RunningGame/MarginContainer/HBoxContainer/ServerIP.text = ""
	$WindowControl/RunningGame/MarginContainer/HBoxContainer/Status.text = "DISCONNECTED"
	$WindowControl.scr_atual = 0
	$WindowControl/RunningGame.visible = false
	$WindowControl/TelaConectar.visible = true

func _on_CheckSuporteMao_toggled(button_pressed):
	if button_pressed:
		suporte_ou_mao = 1
		$WindowControl/TelaMaoSuporte/Lb_sup_mao.text = "Mão"
	else:
		suporte_ou_mao = 0
		$WindowControl/TelaMaoSuporte/Lb_sup_mao.text = "Suporte"
