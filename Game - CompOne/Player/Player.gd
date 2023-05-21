extends KinematicBody2D
# This script controls movement

# Defined variables
const UP = Vector2(0, -1)
const ACCELERATION = 50
const MAX_SPEED = 250
const GRAVITY = 15
const JUMP_HEIGHT = -500

var motion = Vector2()

func _physics_process(delta):
	#physics - Gravity
	motion.y += GRAVITY
	#Friction - Gravity
	var friction = false
	
	#movement - right
	if Input.is_action_pressed("ui_right"):
		#Returns the smallest
		motion.x = min(motion.x+ACCELERATION, MAX_SPEED)
		#Flip Sprite - right
		$Sprite.flip_h = false
		$Sprite.play("Run")
		
	#movement - left
	elif Input.is_action_pressed("ui_left"):
		motion.x += -ACCELERATION
		#Returns the largest
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		#Flip Sprite - left
		$Sprite.flip_h = true
		$Sprite.play("Run")
		
	#movement - stop
	else:
		$Sprite.play("Idle")
		friction = true
		#Adding Friction
		motion.x = lerp(motion.x, 0, 0.2)
		
	#movement - jump
	if is_on_floor():
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
		#Setting friction to in the Air
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
	#Animation - Jump
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.5)
		
	# Return functions
	motion = move_and_slide(motion, UP)
	

	pass


func _on_Area2D_body_entered(body):
	pass # Replace with function body.
