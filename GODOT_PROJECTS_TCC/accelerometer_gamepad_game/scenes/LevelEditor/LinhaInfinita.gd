extends Sprite

#Posição na extremidade
func get_pos_borda():
	return $BordaLinha.global_position

#Remove posição na extremidade pois linha não é mais a última
func delete_borda():
	$BordaLinha.queue_free()

#Define o valor de segundo dessa posição
func set_sec(sec):
	$segundo_label.text = str(sec)
