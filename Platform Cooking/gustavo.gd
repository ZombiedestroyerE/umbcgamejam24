extends CharacterBody2D

@onready var anim = $GusAnim
@onready var gusSprites = $AnimatedSprite2D

@onready var eAnim = $e


var hasTom = false
var hasCheese = false
var hasDough = false
var hasPep = false

var hasShred = false
var hasSause = false

const SPEED = 300.0
const JUMP_VELOCITY = -1000.0 * 1.6

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta):
	eAnim.play("e")
	
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * 2 * delta

	# Handle Jump.
	if Input.is_action_just_pressed("w") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		anim.play("jump")

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction = Input.get_axis("a", "d")
	if direction == -1:
		gusSprites.flip_h = true
	elif direction == 1:
		gusSprites.flip_h = false
	
	if direction:
		velocity.x = direction * SPEED
		if velocity.y == 0:
			anim.play("run")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		if velocity.y == 0:
			anim.play("idle")
	if velocity.y > 0:
		anim.play("fall")

	move_and_slide()


func _on_killzone_area_entered(area: Area2D) -> void:
	pass # Replace with function body.
