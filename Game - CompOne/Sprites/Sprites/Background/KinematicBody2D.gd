extends CharacterBody2D
# This script controls movement
var motion = Vector2()

func _physics_process(delta):
	#Gravity
	motion.y += 10
	#Movement
	if Input.is_action_pressed("ui_right"):
		motion.x = 100
	#Movement
	elif Input.is_action_pressed("ui_left"):
		motion.x = -100
	#Stop	
	else:
		motion.x = 0
		
	set_velocity(motion)
	move_and_slide()
