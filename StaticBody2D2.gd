extends StaticBody2D
var SPEED = 80

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	velocity.x = move_toward(velocity.x, -80, SPEED )
	move_and_slide()
