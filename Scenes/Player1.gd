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
	move(delta)
	move_and_collide(motion)
	
func move(delta):
	if off_bottom_screen() or off_top_screen():
		motion.y = 0
	if Input.is_action_pressed("player1_down") and not off_bottom_screen():
		motion.y = SPEED * delta
	if Input.is_action_pressed("player1_up") and not off_top_screen():
		motion.y = -SPEED * delta
	if Input.is_action_just_released("player1_down") or Input.is_action_just_released("player1_up"):
		motion.y = 0
	
func off_bottom_screen():
	if position.y > 952:
		return true
		
		
func off_top_screen():
	if position.y < 128:
		return true