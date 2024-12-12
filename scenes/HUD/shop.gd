extends Control


func _on_button_pressed() -> void:
	var checkboxes = $CanvasLayer/Panel/Panel/CheckBox as CheckBox
	var base_group = checkboxes.button_group as ButtonGroup
	var cb = base_group.get_pressed_button()
	var name = cb.get_node("Label").text
	print(name)
	if name == "Water Drill":
		Global.current_tile = Vector3i(0,0,0)
		Global.add_water_currency(-300)
	if name == "Water Pump":
		Global.current_tile = Vector3i(2,0,0)
		Global.add_water_currency(-1000)
	if name == "Laboratory":
		Global.current_tile = Vector3i(5,0,0)
		Global.add_water_currency(-7000)
	if name == "Ice Drill":
		Global.current_tile = Vector3i(3,0,0)
		Global.add_water_currency(-600)
	queue_free()


func _on_button_2_pressed() -> void:
	queue_free()
