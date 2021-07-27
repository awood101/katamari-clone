extends Spatial
onready var player = get_node("../Player")
onready var cam = $Camera


func _physics_process(_delta):
	#follows ball without applying transforms to camera
	transform.origin = player.transform.origin
	cam.look_at(player.transform.origin, Vector3(0, 1, 0))
	if Input.is_action_pressed("rotate_ccw"):
		rotate_y(-0.03)
	if Input.is_action_pressed("rotate_cw"):
		rotate_y(0.03)
