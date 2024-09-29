extends Node2D

@onready var bgTextBox = $UI/backgroundTextBox
@onready var bgCharBox = $UI/charSpriteBackground
@onready var sratButton = $UI/startWork
@onready var dialogBox = $UI/dialogBox
@onready var nameChar = $UI/nameChar

@onready var fadeInAnim = $AnimationPlayer
@onready var fadeinPanel = $AnimationPlayer/Panel

@onready var itemPanel = $UI/itemPanel/AnimatedSprite2D


@onready var gus = $Gus
@onready var eGus = $Gus/e

var toggleOven = false
var toggleAssem = false
var toggleGarbage = false

var doughPick = false
var tomPick = false
var cheesePick = false
var pepPick = false

#Assembly table ingrediants
var hasSauce = false
var hasShred = false
var hasDough = false
var hasPep = false


var drawTextSpeed = 1
var chatterLimit = 100

var start = false

var playerMove = false
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
	if !playerMove:
		gus.set_physics_process(false)
	else: 
		gus.set_physics_process(true)
	
	if toggleOven and Input.is_action_pressed("e"):
		pass
		
	if toggleAssem and Input.is_action_pressed("e"):
		if gus.hasDough and !hasDough:
			gus.hasDough = false
			hasDough = true
			doughPick = false
			
	if toggleGarbage and Input.is_action_pressed("e"):
		if gus.hasDough or gus.hasCheese or gus.hasTom or gus.hasPep:
			gus.hasDough = false
			gus.hasCheese = false
			gus.hasTom = false
			gus.hasPep = false
			
			doughPick = false
			
			
	if doughPick and Input.is_action_pressed("e") and !cheesePick and !pepPick and !tomPick:
		gus.hasDough = true
		
		
		
		
		
		
	if gus.hasDough:
		itemPanel.play("dough")
	else:
		itemPanel.play("none")
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
	playerMove = true


func _on_oven_body_entered(body):
	if body.name == "Gus":
		eGus.visible = true
		toggleOven = true


func _on_assemble_table_body_entered(body):
	if body.name == "Gus":
		eGus.visible = true
		toggleAssem = true


func _on_dough_station_body_entered(body):
	if body.name == "Gus":
		eGus.visible = true
		doughPick = true


func _on_assemble_table_body_exited(body):
	if body.name == "Gus":
		eGus.visible = false
		toggleAssem = false


func _on_oven_body_exited(body):
	if body.name == "Gus": 
		eGus.visible = false
		toggleOven = false


func _on_dough_station_body_exited(body):
	if body.name == "Gus":
		eGus.visible = false
		doughPick = false


func _on_garbage_body_entered(body):
	if body.name == "Gus":
		eGus.visible = true
		toggleGarbage = true


func _on_garbage_body_exited(body):
	if body.name == "Gus":
		eGus.visible = false
		toggleGarbage = false



func _on_killzone_body_entered(body):
	if body.name == "Gus":
		gus.global_position = Vector2(550,0)
		


func _on_killzone_spike_body_entered(body):
	if body.name == "Gus":
		gus.global_position = Vector2(550,0)
