extends RigidBody2D

func _process(_delta):
	grab()

func grab():
	var c = get_colliding_bodies()
	if c is CollisionObject2D:
		$Sprite2D2.hide()
