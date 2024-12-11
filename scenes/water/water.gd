extends Node
class_name Water
var travelled = []
var quantity
func _init(q, pos: Vector2i):
	add_to_group("water")
	quantity=q
	travelled.append(pos)
