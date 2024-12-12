extends Control


func _on_pause_pressed() -> void:
	Global.pause_mode = true


func _on_delete_pressed() -> void:
	Global.delete_mode = true
