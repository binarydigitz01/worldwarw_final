extends Control


func _on_button_pressed() -> void:
	var checkboxes = $CanvasLayer/Panel/Panel/CheckBox as CheckBox
	var base_group = checkboxes.button_group as ButtonGroup
	var cb = base_group.get_pressed_button()
	var name = cb.get_node("Label").text
	print(name)
	if name == "Water Drill":
		Global.current_tile = Vector3i(0,0,0)
	if name == "Water Pump":
		Global.current_tile = Vector3i(2,0,0)
	if name == "Laboratory":
		Global.current_tile = Vector3i(5,0,0)
	queue_free()
