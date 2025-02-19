extends CharacterBody2D
var SPEED = 200 
var Dash = 400
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(delta):
	# Add the gravity.
	var direction = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if direction:
		velocity = SPEED * direction
	else:
		velocity = Vector2.ZERO
	
	if Input.is_action_pressed("Run"):	
		velocity  = Dash * direction
	
	move_and_slide()
