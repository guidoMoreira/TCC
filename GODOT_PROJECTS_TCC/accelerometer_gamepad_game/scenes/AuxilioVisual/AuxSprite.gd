extends Sprite3D

#Escala Final e nível da cor verde
var oscale = 0.905
var green_color = 1

#Inicializando escala
func _ready():
	scale.x = 0.01
	scale.y = 0.01

#Diminuindo tamanho
func _physics_process(delta):
	if scale.x < oscale:
		scale.x+=0.01
		scale.y+=0.01

#Mudando cor de verde para vermelho
func _process(delta):
	if green_color > 0:
		green_color -= 2/255.0
		modulate = Color(1,green_color,1)
	
