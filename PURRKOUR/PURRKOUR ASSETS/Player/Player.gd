extends CharacterBody2D
class_name Player

const acceleration = 300
var max_speed = 200
const friction = 400
const JUMP_VELOCITY = -300

var max_health = 1
var health = 0
var can_take_damage = true
@export var death = false

var hp = 5

signal healthChanged
signal killed

@onready var animationPlayer = $AnimationPlayer
@onready var animation_tree = $AnimationTree
@onready var animationState = animation_tree.get("parameters/playback")

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
var jump_count = 0
var jump_max = 2

func _ready():
	GameManager.coins = 0
	health = max_health
	GameManager.player = self


func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	
	if input_vector != Vector2.ZERO:
		animation_tree.set("parameters/Idle/blend_position", input_vector)
		animation_tree.set("parameters/Run/blend_position", input_vector)
		animation_tree.set("parameters/Jump/blend_position", input_vector)
		animation_tree.set("parameters/Fall/blend_position", input_vector)
		animationState.travel("Run")
		velocity = velocity.move_toward(input_vector * max_speed, acceleration * delta)
		
	else:
		animationState.travel("Idle")
		velocity = velocity.move_toward(Vector2.ZERO, friction * delta)
		
	if is_on_floor():
		jump_count = 0
		
	if jump_count < jump_max:
		if Input.is_action_just_pressed("ui_accept"):
			$Jump.play()
			velocity.y = JUMP_VELOCITY

			jump_count += 1
			
	if not is_on_floor():
		if velocity.y > 0:
			animationState.travel("Fall")
		elif velocity.y < 0:
			animationState.travel("Jump")
		velocity.y += gravity * delta
		
	move_and_slide()

func take_damage(damage_amount : int):
	if can_take_damage:
		iframes()
		
		death = true
		health -= damage_amount
		
		if health <= 0:
			$Death.play()
			hp -= 1
			die()
			healthChanged.emit(hp)
			
func iframes():
	can_take_damage = false
	await get_tree().create_timer(1).timeout
	can_take_damage = true

func die():
	if hp == 0:
		max_speed = 0
		SceneTransition.change_scene_to_file("res://Menu/gameover.tscn")
	GameManager.respawn_player()
	
func _on_collecting_coins_area_entered(area):
	if area.get_parent() is Coins:
		$CollectingCoins/AudioStreamPlayer2D.play()
		
