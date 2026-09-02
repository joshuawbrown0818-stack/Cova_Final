extends Node2D



func _ready() -> void:
	$Timer.start()
 


 


func _on_timer_timeout() -> void:
	AudioManager.play_track(AudioManager.Track.CHASE)
