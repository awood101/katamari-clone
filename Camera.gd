extends Camera

onready var player = get_node("../../Player")
onready var offset = get_global_transform().origin
onready var init_pos = translation * 2
var plane_normal = Vector3(0, 1, 0)
var strength = 0.1
#func _init():
	#set_as_toplevel(true)

func _physics_process(_delta):
	translation = init_pos + Vector3(0, 0, player.mesh_instance.mesh.radius * 0.8)
	var target = player.get_global_transform().origin
	var vec_to_player = target - get_global_transform().origin
	if Input.is_action_pressed("forward"):
		player.apply_central_impulse(vec_to_player.normalized() * strength)#, Vector3(0, 0, 0))
	if Input.is_action_pressed("back"):
		player.apply_central_impulse(vec_to_player.normalized() * -strength)#, Vector3(0, 0, 0))
	if Input.is_action_pressed("left"):
		player.apply_central_impulse(vec_to_player.cross(plane_normal).normalized() * -strength)#, Vector3(0, 0, 0))
	if Input.is_action_pressed("right"):
		player.apply_central_impulse(vec_to_player.cross(plane_normal).normalized() * strength)#, Vector3(0, 0, 0))
	$RadiusOutput.text = str(player.mesh_instance.mesh.radius)
	if player.mesh_instance.mesh.radius >= 5.0:
		$Label.visible = false
		$RadiusOutput.visible = false
		$FinalMsg.visible = true
