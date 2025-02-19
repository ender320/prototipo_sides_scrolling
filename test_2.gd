extends CharacterBody2D

var SPEED = 300
# Get the gravity from the project settings to be synced with 


func _physics_process(delta):
	
	var direção = Vector2(Input.get_axis("ui_left", "ui_right"), Input.get_axis("ui_up", "ui_down"))
	if direção:
		velocity = SPEED * direção
	else:
		velocity = Vector2.ZERO
	
	move_and_slide()

func _input(event):
	if Input.is_action_pressed("Run"):
		SPEED = 800
	else:
		SPEED = 300
