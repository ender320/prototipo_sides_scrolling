extends Area2D


func _on_body_entered(body):
	if body.name == "Player":
		queue_free()
		print("jump resetado")
		body.jump_count = 1
		body.dash_count = 1
		
		
		
		
  
