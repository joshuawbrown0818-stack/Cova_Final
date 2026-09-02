extends Node2D
@onready var win: AudioStreamPlayer = $win



func _ready() -> void:
	win.play()
