extends CharacterBody2D

func _process(_delta):
	grab()

func grab():
	for i in get_slide_collision_count():
		print("test")
		var c = get_slide_collision(i)
		print("test 1")
		if c.get_collider() is CharacterBody2D:
			print("test 2")
			$ballspritetest.hide()
			
