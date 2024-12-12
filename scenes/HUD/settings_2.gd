extends TextureButton


func _on_pressed() -> void:
	var root = get_parent().get_parent().get_parent()
	var menu = load("res://scenes/HUD/shop.tscn")
	root.add_child(menu.instantiate())
