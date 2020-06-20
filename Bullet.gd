extends KinematicBody2D


export var speed = 600;
export var damage = 1;
var direction = Vector2(1,0);
var starting_position


# Called when the node enters the scene tree for the first time.
func _ready():
	# When bullet spawned set direction
	pass


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	# if the bullet is off the screen
	# free it from queue
	# else move in specified direction.
	var velocity = direction.normalized() * speed
	move_and_slide(velocity)


func _on_Timer_timeout():
	queue_free()
