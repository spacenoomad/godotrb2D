extends RigidBody2D

export var speed = 200
export var jump_force = 50

var touch_ground = true

func _physics_process(delta):
	move()

func move():
	var my_vert_vel = get_linear_velocity().y
	
	if Input.is_key_pressed(KEY_D):
		set_linear_velocity(Vector2(1 * speed, my_vert_vel))
	elif Input.is_key_pressed(KEY_A):
		set_linear_velocity(Vector2(-1 * speed, my_vert_vel))
	else: 
		set_linear_velocity(Vector2(0, my_vert_vel))
		
	if Input.is_key_pressed(KEY_W):
		if touch_ground == true:
			apply_impulse(Vector2(), Vector2(0, -1 * jump_force))

func _on_Area2D_body_entered(touched):
	if touched.get_name() == "TileMap":
		touch_ground = true


func _on_Area2D_body_exited(touched):
	if touched.get_name() == "TileMap":
		touch_ground = false
