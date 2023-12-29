extends CharacterBody2D


const SPEED = 300.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
####SHOULD BE ABLE TO REMOVE GRAVITY
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var anim = get_node("AnimatedSprite2D/AnimationPlayer")

####SHOULD BE ABLE TO REMOVE PHYSICS PROCESS COMPLETELY
func _physics_process(delta):
	# Add the gravity.
	if not is_on_floor():
		velocity.y += gravity * delta

####REMOVE JUMP
	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
####INTEGRATE VERTICLE INPUT DIRECTIONS
####IMPLEMENT WAY FOR SPRITE TO CHANGE DIR BASED ON INPUT
	var direction = Input.get_axis("ui_left", "ui_right")
####INTEGRATE SPRINTING AND CREATE CASE FOR RUNNING ANNIMATION
	if direction:
		velocity.x = direction * SPEED
		anim.play("walk")
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		anim.play("idle")

	move_and_slide()
