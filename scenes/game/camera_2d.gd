extends Camera2D

func _input(event: InputEvent) -> void:
	if event is InputEventScreenDrag:
		event = event as InputEventScreenDrag
		offset-=event.relative/zoom.length()
	if event is InputEventScreenPinch:
		event = event as InputEventScreenPinch
		print(event.relative)
		zoom += event.relative
