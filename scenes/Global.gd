extends Node

var water_array = []
var ground_water: float = 100
var water_currency: int = 5000
const CURRENCY_THRESHOLD = 5000

func update_groundwater(gw: float):
	var tp : TextureProgressBar = get_tree().get_first_node_in_group("groundwatertp")
	tp.value = gw
	ground_water = gw

func add_water_currency(water: int):
	var water_currency_label : Label = get_tree().get_first_node_in_group("water_currency")
	water_currency += water
	water_currency_label.text = str(water_currency)
