extends Node

var water_array = []
var ground_water: float = 66
var water_currency: int = 10000
var is_raining: bool = false
const CURRENCY_THRESHOLD = 10000

var current_tile = null

var pause_mode = false
var play_mode = false

var ice = 500
var ICE_THRESHOLD = 500

func update_groundwater(gw: float):
	var tp : TextureProgressBar = get_tree().get_first_node_in_group("groundwatertp")
	tp.value = gw
	ground_water = gw

func add_water_currency(water: int):
	var water_currency_label : Label = get_tree().get_first_node_in_group("water_currency")
	water_currency += water
	water_currency_label.text = str(water_currency)

func update_pollution(average_water_quality: float):
	var pollution_label: Label = get_tree().get_first_node_in_group("water_pollution_level")
	pollution_label.text = str(clamp(100 - average_water_quality,0,100)) + "%"

func add_ice_currency(i: int):
	ice = clamp(ice + i,0, ICE_THRESHOLD)
	var ice_label = get_tree().get_first_node_in_group("ice_label")
	ice_label.text = str(ice)
	
func update_max_ice():
	var building_layer: TileMapLayer = get_tree().get_first_node_in_group("BuildingLayer")
	var count = len(building_layer.get_used_cells_by_id(6))
	ICE_THRESHOLD = count* 500
