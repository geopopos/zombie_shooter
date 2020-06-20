extends Node2D

export(PackedScene) var bullet_type


# Called when the node enters the scene tree for the first time.
func _ready():
	get_parent().connect("shoot", self,"_on_Weapon_shoot")


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_Weapon_shoot(game_scene, player_rotation):
	print($BulletCooldownTimer.time_left)
	if $BulletCooldownTimer.time_left <= 0:
		var new_bullet = bullet_type.instance();
		new_bullet.global_position = global_position
		new_bullet.direction = player_rotation
		game_scene.add_child(new_bullet)
		$BulletCooldownTimer.start(0.5)
