extends Control

func _ready() -> void:
	AudioManager.play_track(AudioManager.Track.TITLE)
	


func _on_play_pressed() -> void:
	get_tree().change_scene_to_file("res://Assets/Scenes/cutscene.tscn")


func _on_quit_pressed() -> void:
	get_tree().quit()
