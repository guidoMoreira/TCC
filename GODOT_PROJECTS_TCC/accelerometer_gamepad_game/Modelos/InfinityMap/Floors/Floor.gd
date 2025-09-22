extends Spatial


#Get poisção da borda
func get_borda_pos():
	return $Borda.global_translation

#Deleta borda que não é mais usada
func _remove_borda():
	$Borda.queue_free()

#Deleta pedaço do chão ao fim do timer
func _on_TimerDie_timeout():
	queue_free()

#Toca som do rio para quando o visual for de ponte
func _som_rio():
	$AudioRio.play()
