extends Area2D
@onready var timer: Timer = $Timer


func _on_body_entered(body: Node2D) -> void:
	if body.has_method("just_died"):
		body.just_died()	
	
	timer.start()

func _on_timer_timeout() -> void:
	call_deferred("reset_level")
	
	
func reset_level():
	get_tree().reload_current_scene()
