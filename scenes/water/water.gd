extends Node
class_name Water
var travelled = []
var quantity
var water_quality
func _init(q, pos: Vector2i, water_quality):
	Global.water_array.append(self)
	quantity=q
	self.water_quality = water_quality
	travelled.append(pos)
