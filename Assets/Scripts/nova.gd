extends CharacterBody2D

@onready var speed = 200.0
@onready var jump_force = -350.0
@onready var AS = $AnimatedSprite2D
@onready var dash: AudioStreamPlayer = $sfx/dash
@onready var jump: AudioStreamPlayer = $sfx/jump
@onready var damage: AudioStreamPlayer = $sfx/damage




var can_dash = true
var is_dashing = false
var dash_direction = 0
var is_dead = false

func _physics_process(delta: float) -> void:
	if is_dead:
		move_and_slide()
		return
	
	if not is_on_floor():
		velocity += get_gravity() * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
		jump.play()
	
	var direction = Input.get_axis("left", "right")
	
	
	if Input.is_action_just_pressed("dash") and can_dash and direction != 0:
		is_dashing = true
		can_dash = false
		dash_direction = direction
		velocity.x = dash_direction * speed * 2
		AS.play("dash")
		dash.play()
		$dash_timer.start()
	
	
	if not is_dashing:
		if direction:
			velocity.x = direction * speed
		else:
			velocity.x = move_toward(velocity.x, 0, speed)
	
	handleanimation(direction)
	move_and_slide()
	
func handleanimation(dir):
	handlespriteflip(dir)
	
	if is_dashing:
		return
	
	if is_on_floor():
		if velocity.x != 0:  
			AS.play("run")
		else:
			AS.play("idle")
	else:
		AS.play("jump")
		


func handlespriteflip(dir):
	if dir > 0:
		AS.flip_h = false
	elif dir < 0:
		AS.flip_h = true 
		
func _on_dash_timer_timeout() -> void:
	is_dashing = false
	$cooldown.start()
	
	
func _on_cooldown_timeout() -> void:
	can_dash = true
	
func just_died():
	if is_dead:
		return
	is_dead = true
	is_dashing = false
	velocity = Vector2.ZERO
	$dash_timer.stop()
	$cooldown.stop()
	damage.play()
	AS.play("dying")
	
	
	
		
	
	
