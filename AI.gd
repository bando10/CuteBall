extends Node2D

var character_body : CharacterBody2D = null
var rigid_body : RigidBody2D = null

func _ready():
	character_body = $dinoVert
	rigid_body = $Ball

	# Connectez le signal de collision

func _on_body_entered(body):
	# Vérifiez si le corps entré est le dinoVert
	if body == character_body:
		print("Collision détectée !")
		detected_collision()

func detected_collision():
	# Mettez ici le code à exécuter lorsque la collision est détectée
	print("Le dinoVert a rencontré la balle !")
	# Ajoutez ici le code pour masquer la balle, par exemple
	rigid_body.hide()
