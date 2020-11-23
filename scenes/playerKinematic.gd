extends KinematicBody2D

const UP = Vector2(0, -1)
var motion = Vector2()

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta):
	if not is_on_floor():
		motion.y += 10
	
	if Input.is_key_pressed(KEY_D):
		motion.x = 200
	elif Input.is_key_pressed(KEY_A):
		motion.x = -200
	else:
		motion.x = 0
		
	if is_on_floor():
		if Input.is_key_pressed(KEY_W):
			motion.y = -500
		
	motion = move_and_slide(motion, UP)
