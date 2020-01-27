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
	move()
	move_and_slide(motion,UP)
	
func move():
	if Input.is_action_pressed("player2_down"):
		print("hello")
		motion.y = SPEED
	if Input.is_action_pressed("player2_up"):
		motion.y = -SPEED
	if Input.is_action_just_released("player2_down") or Input.is_action_just_released("player2_up"):
		motion.y = 0