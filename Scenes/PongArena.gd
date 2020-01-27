extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var p1_score = 0 
var p2_score = 0


# Called when the node enters the scene tree for the first time.
func _ready():
	$BackgroundMusic.play() # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	check_score()
	$CenterContainer/VBoxContainer/HBoxContainer/P1Score.text = str(p1_score)
	$CenterContainer/VBoxContainer/HBoxContainer/P2Score.text = str(p2_score)
	
func _on_KinematicBody2D_p1_score():
	p1_score += 1


func _on_KinematicBody2D_p2_score():
	p2_score +=1


func _on_KinematicBody2D_reset():
	var start_dir = [-1,1]
	$NotificationBox/Notification.text = "Restarting!"
	$KinematicBody2D.position.x = 960
	$KinematicBody2D.position.y = 540
	$KinematicBody2D.speed = 0
	yield(get_tree().create_timer(3.0), "timeout")
	$NotificationBox/Notification.text  = ""
	$KinematicBody2D.speed = 750
	randomize()
	start_dir.shuffle()
	$KinematicBody2D.velocity = Vector2(start_dir[0],0)
	
func check_score():
	if p1_score > 3:
		$NotificationBox/Notification.text = "Player 1 WINS!"
		reset_score()
	if p2_score > 3:
		$NotificationBox/Notification.text = "Player 2 WINS!"
		reset_score()
	
	
func reset_score():
	p1_score = 0
	p2_score = 0
	yield(get_tree().create_timer(3.0), "timeout")
	_on_KinematicBody2D_reset()
	
	
	
	