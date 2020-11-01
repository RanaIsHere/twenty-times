extends KinematicBody2D

var speed = 200
var gravity = 1000
var jumpSpeed = 465
var velocity = Vector2.ZERO

func get_input(var delta):
	velocity.x = 0
	
	if Input.is_action_pressed("ui_right"):
		velocity.x += 1 * speed
	if Input.is_action_pressed("ui_left"):
		velocity.x -= 1 * speed
	if Input.is_action_just_pressed("jump"):
		if is_on_floor():
			velocity.y = -jumpSpeed
	
	if Input.is_action_pressed("ui_down"):
		$Camera2D.offset_v = 1
	else:
		$Camera2D.offset_v = 0
	
	velocity.y += gravity * delta
	
	velocity = move_and_slide(velocity, Vector2.UP)
	
func _physics_process(delta):
	get_input(delta)
