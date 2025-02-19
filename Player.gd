extends CharacterBody2D


var SPEED = 600.0
const JUMP_VELOCITY = -600
const  DOUBLE_JUMP = -700
var dj_coin = 0
var jump_count = 1
var max_jump = 2
var push = 2000
var DASH = 50
var DASH_Y
var dash_count = 1
var max_dash = 2
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _ready():
	pass
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("ui_accept") and jump_count < max_jump:
		velocity.y = JUMP_VELOCITY
		if not is_on_floor():
			jump_count += 1
			velocity.y = DOUBLE_JUMP
	if is_on_floor():
		jump_count = 1 
	if Input.is_action_just_pressed("Push"):
		velocity.y = push
		dash_count = max_dash
		jump_count = max_jump
		SPEED = 10
	
	if is_on_floor():
		SPEED = 600.0
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if not is_on_floor() and dash_count < max_dash:
		if Input.is_action_just_pressed("Run") and direction:
			velocity.x = direction * SPEED * DASH
			dash_count += 1
	elif is_on_floor():
		dash_count = 1

	move_and_slide()
