extends Camera

onready var player = get_node("../Player")
onready var offset = transform.origin - player.transform.origin
var PLAYER_ROTATION_SPEED = 0.03 #radians

func _process(delta):
	transform.origin = player.transform.origin + offset
	#key: q
	if Input.is_action_pressed("rotate_ccw"):
		rotate_y(PLAYER_ROTATION_SPEED)
	#key: e
	if Input.is_action_pressed("rotate_cw"):
		rotate_y(-PLAYER_ROTATION_SPEED)
