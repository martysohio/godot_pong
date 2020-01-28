extends KinematicBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
#func _ready():
	#pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

var motion = Vector2(0,0)
const UP = Vector2(0,-1)
const SPEED = 1000


func _physics_process(delta):
	if global.player_mode == 1:
		ai()
	else:
		move(delta)
		move_and_collide(motion)
	
func move(delta):
	if off_bottom_screen() or off_top_screen():
		motion.y = 0
	if Input.is_action_pressed("player2_down") and not off_bottom_screen():
		motion.y = SPEED * delta
	if Input.is_action_pressed("player2_up") and not off_top_screen():
		motion.y = -SPEED * delta
	if Input.is_action_just_released("player2_down") or Input.is_action_just_released("player2_up"):
		motion.y = 0
		
func off_bottom_screen():
	if position.y > 952:
		return true
		
		
func off_top_screen():
	if position.y < 128:
		return true
		
func ai():
	if global.ball_position:
		if global.ball_position.x > 800:
			if off_bottom_screen() or off_top_screen():
				motion.y = 0
			if position.y < global.ball_position.y and not off_bottom_screen():
				position = position.linear_interpolate(Vector2(1856,global.ball_position.y), .2)
			if position.y > global.ball_position.y and not off_top_screen():
				position = position.linear_interpolate(Vector2(1856,global.ball_position.y), .2)
	else:
		motion.y = 0