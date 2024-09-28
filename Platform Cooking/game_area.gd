extends Node2D

@onready var bgTextBox = $UI/backgroundTextBox
@onready var bgCharBox = $UI/charSpriteBackground
@onready var sratButton = $UI/startWork
@onready var dialogBox = $UI/dialogBox
@onready var nameChar = $UI/nameChar

@onready var fadeInAnim = $AnimationPlayer
@onready var fadeinPanel = $AnimationPlayer/Panel


var drawTextSpeed = 1
var chatterLimit = 100

var start = false
# Called when the node enters the scene tree for the first time.
func _ready():
	dialogBox.text = ""
	fadeinPanel.visible = true
	fadeInAnim.play("fadeIn")
	await fadeInAnim.animation_finished
	start = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#fadeInAnim.play("fadeIn")
	#await fadeInAnim.animation_finished
	#drawTextSpeed = 1
	if !start:
		dialogBox.visible_characters = 0
	dialogBox.text = "What are you doing sleeping on the job?? Get back to work!!! You have 3 minutes to serve 6 orders!!!"
	_show_chatter()
	#dialogBox.text = "What are you doing sleeping on the job?? Get back to work!!! You have 3 minutes to serve 6 orders!!!"
	
func _show_chatter():
	if 1 < 33 and start:
		drawTextSpeed += 1
		dialogBox.visible_characters = drawTextSpeed


func _on_start_work_pressed():
	bgCharBox.visible = false
	bgTextBox.visible = false
	sratButton.visible = false
	dialogBox.visible = false
	nameChar.visible = false
