extends Control


onready var chart_graph = get_node("CGLine")
var rng = RandomNumberGenerator.new()
var x = 0
func _ready():
	chart_graph.initialize(chart_graph.LABELS_TO_SHOW.NO_LABEL,
	{
		angulo_conseguido = Color(0.58, 0.92, 0.07),
		angulo_ideal = Color(0.2, 0.92, 0.07)
	})
	chart_graph.set_labels(7)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Timer_timeout():
	pass
	#chart_graph.create_new_point({
	#	label = String(x),
	#	values = {
	#	  stock = rng.randi_range(-50,50),
	#	  stock2 = rng.randi_range(-50,50)
	#	}
	#})
	#x = x + 1
	
func add_points(xv,valuesy):
	chart_graph.create_new_point({
		label = String(xv),
		values = valuesy
	})
