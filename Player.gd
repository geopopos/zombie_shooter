extends KinematicBody2D

signal shoot(game_scene, player_rotation)

# remove this once bullet spawning is implemented on weapon.
const BULLET = preload("res://Bullet.tscn")
export(int) var bullet
# remove



export(PackedScene) var weapon_type
export var speed = 200
var velocity = Vector2()
var movement_direction = Vector2()
var player_rotation_direction = Vector2()
var weapon;

# Called when the node enters the scene tree for the first time.
func _ready():
	weapon = weapon_type.instance()
	# new_weapon.global_position = Vector2(global_position.y, global_position.x)
	weapon.position.y += 12
	weapon.position.x += 15
	add_child(weapon)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# handle movement direction and position update
	movement_direction = Vector2((Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")), (Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")))
	
	if movement_direction.length() > 0:
		velocity = movement_direction.normalized() * speed
		move_and_slide(velocity)
	
	# handle player rotation	
	player_rotation_direction = Vector2((Input.get_action_strength("player_face_right") - Input.get_action_strength("player_face_left")), (Input.get_action_strength("player_face_down") - Input.get_action_strength("player_face_up")))
	
	if player_rotation_direction.length() > 0:
		print("shoot")
		emit_signal("shoot", get_parent(), player_rotation_direction)
#		if $BulletCooldownTimer.time_left <= 0:
#			var new_bullet = BULLET.instance()
#			new_bullet.global_position = global_position
#			new_bullet.direction = player_rotation_direction
#			get_parent().add_child(new_bullet)
#			$BulletCooldownTimer.start(0.5)
		rotation_degrees = (player_rotation_direction.angle()*180/PI)


