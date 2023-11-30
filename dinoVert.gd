extends CharacterBody2D

@export var speed = 300

func get_input():
	var input_direction = Input.get_vector("left", "right", "up", "down")
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	move_and_slide()
	
	
var rigid_body: RigidBody2D
var character_body: CharacterBody2D
		
func _process(_delta):
	grab_ball(rigid_body)
	grab_from_player(character_body)
	#follow_player()
	shoot_ball()
	
			
func grab_ball(body):
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is RigidBody2D:
			speed = 350
			$BallSprite.show()
			$"../Ball".queue_free()
		else:
			speed = 100
			
func grab_from_player(body):
	for i in get_slide_collision_count():
		var c = get_slide_collision(i)
		if c.get_collider() is CharacterBody2D and c.get_collider_id() != 31843157510 and $"../dinoRouge/BallSprite".visible:
			$BallSprite.show()
			$"../dinoRouge/BallSprite".hide()
			
func follow_player():
	if $"../dinoRouge/BallSprite".visible:
		var direction = $"../dinoRouge".global_position - global_position
		direction = direction.normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		

func shoot_ball():
	if $BallSprite.visible:
		var ball = $BallSprite  # Supposons que le nœud de la balle est directement sous ce script
		var shoot_direction = Vector2(1, 0)  # Changer la direction selon vos besoins

		for i in get_slide_collision_count():
			var c = get_slide_collision(i)

			# Vérifiez si le collider est un CharacterBody2D avec l'ID spécifié
			if c.get_collider() is CharacterBody2D and c.get_collider_id() == 31843157510:
				# Lancez la balle avec une vélocité dans la direction spécifiée
				#var impulse = shoot_direction.normalized() * 1
				#print(impulse)
				#ball.apply_impulse(impulse)
				
				print("GOALLLLLL du joueur vert");

				# Vous pouvez également masquer la balle après le tir si nécessaire
				$BallSprite.hide()
	else:
		pass 
		
