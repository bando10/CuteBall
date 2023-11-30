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
		#print($"../dinoRouge/BallSprite".visible)
		if c.get_collider() is CharacterBody2D and c.get_collider_id() == 31641830556 and $"../dinoVert/BallSprite".visible:
			$BallSprite.show()
			$"../dinoVert/BallSprite".hide()
			
			
func follow_player():
	if $"../dinoVert/BallSprite".visible:
		var direction = $"../dinoVert".global_position - global_position
		direction = direction.normalized()
		velocity = direction * speed
		move_and_slide()
	else:
		velocity = Vector2.ZERO
		
func shoot_ball():
	if $BallSprite.visible:
		for i in get_slide_collision_count():
			var c = get_slide_collision(i)
			#print(c.get_collider())
			if c.get_collider() is CharacterBody2D and c.get_collider_id() == 31792825859:
				print("GOALLLL du joueur rouge");
				$BallSprite.hide();
	else:
		pass
