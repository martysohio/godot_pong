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


export var speed = 750
#var initial_dir = randi()%2
export var velocity = Vector2(1,.1)
signal p1_score
signal p2_score
signal reset


func _physics_process(delta):
	
	velocity = velocity.normalized() * speed * delta
	var info =move_and_collide(velocity)
	if info != null:
		$Hit.play()
#		velocity.x = - velocity.x
		speed+=100
		velocity = velocity.bounce(info.normal)
		velocity = velocity.normalized() + info.collider_velocity.normalized()
	
	ball_position()
	off_screen_y()
	off_screen_x()
		
func ball_position():
	global.ball_position = position

func off_screen_y():
	if position.y > 1048 or position.y < 32:
		velocity.y = -velocity.y	
		
func off_screen_x():
	if position.x < 0:
		emit_signal("p2_score")
		reset_ball()
	if position.x > 1856:
		emit_signal("p1_score")
		reset_ball()
	
	
func reset_ball():
	emit_signal("reset")
			