extends AnimatableBody2D

@onready var AS = $AnimatedSprite2D

func _ready():
	AS.play("hi!")
	$wait.start()
	


func _on_wait_timeout() -> void:
	AS.play("change")
	AS.play("turned")
