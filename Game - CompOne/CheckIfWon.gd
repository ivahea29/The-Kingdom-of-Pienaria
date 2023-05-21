extends Area2D

func _physics_process(delta):
	# Creating a collision betwen Player and LevelComplete Sprite
	var bodies = get_overlapping_bodies()
	print(bodies)
	#for loop to to make sure body, connects with levelComplete
	for body in bodies:
		if body.name == "Player":
			#Change to "World2" setting
			get_tree().change_scene("res://Scenes/World2.tscn")
