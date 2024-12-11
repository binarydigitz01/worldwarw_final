extends Node
class_name Water
var travelled = []
var quantity
func _init(q, pos: Vector2i):
	Global.water_array.append(self)
	print("Group: ", get_groups())
	quantity=q
	travelled.append(pos)
