extends TileMapLayer

var moisture = FastNoiseLite.new()
var temperature = FastNoiseLite.new()
var altitude = FastNoiseLite.new()

var width = 64
var height = 64

var loaded_chunks = []

func _ready():
	moisture.seed = randi()
	temperature.seed = randi()
	altitude.seed = randi()
	altitude.frequency = 0.01

	for i in range(5,55):
		for j in range(5,55):
			pass
			# generate_chunk(Vector2(i,j))

func generate_chunk(pos):
	for x in range(width):
		for y in range(height):
			var moist = moisture.get_noise_2d(pos.x,pos.y)*10
			var temp = temperature.get_noise_2d(pos.x,pos.y)*10
			var alt = altitude.get_noise_2d(pos.x,pos.y)*10
			set_cell(Vector2i(pos.x, pos.y), 0, Vector2(round(3 * (moist + 10) / 20), round(3*(temp + 10)/20)))
			
#func _input(event: InputEvent) -> void:
	#if event is InputEventMouseButton and event.is_pressed():
		#print(local_to_map(event.global_position-global_position))
