extends CPUParticles2D

func _on_rain_tick_timeout() -> void:
	Global.setRaining(randi_range(0,100)+100<Global.ground_water)
	set_visible(Global.getRaining())
		
		
