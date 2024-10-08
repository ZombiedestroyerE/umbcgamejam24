extends Node2D

@onready var anim = $fadeIn/AnimationPlayer
@onready var fadePane = $fadeIn/AnimationPlayer/Panel
# Called when the node enters the scene tree for the first time.
func _ready():
	fadePane.visible = true
	anim.play("fadeIn")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_start_button_pressed():
	fadePane.visible = true
	anim.play("fadeOut")
	await anim.animation_finished
	get_tree().change_scene_to_file("res://game_area.tscn")


func _on_how_to_play_pressed():
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()
