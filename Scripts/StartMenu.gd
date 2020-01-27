extends Control

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	$TitleMusic.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_1Player_pressed():
	get_tree().change_scene("res://Scenes/PongArena.tscn")

func _on_2Player_pressed():
	get_tree().change_scene("res://Scenes/PongArena.tscn")