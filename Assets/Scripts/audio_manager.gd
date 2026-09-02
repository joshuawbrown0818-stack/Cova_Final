extends Node

enum Track { NONE, MAIN, TITLE, CHASE }

var current_track: int = Track.NONE

@onready var main_player := $MainPlayer
@onready var title_player := $TitlePlayer
@onready var chase_player := $ChasePlayer

func _ready():
	pass

func play_track(track: int):
	if current_track == track:
		return  

	current_track = track

   
	main_player.stop()
	title_player.stop()
	chase_player.stop()

	match track:
		Track.MAIN:
			main_player.play()
		Track.TITLE:
			title_player.play()
		Track.CHASE:
			chase_player.play()

func stop_all():
	current_track = Track.NONE
	main_player.stop()
	title_player.stop()
	chase_player.stop()
