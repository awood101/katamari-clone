extends RigidBody
var vector = Vector3()
var PLAYER_SPEED = 20
var PLAYER_ROTATION_SPEED = 0.03 #radians
onready var mesh_instance = $MeshInstance
#doesn't work
#onready var collision = get_child(1)
onready var group = "player"

func grow(obj_val):
	mesh_instance.mesh.radius += obj_val
	mesh_instance.mesh.height += obj_val * 2
	#can't assign result of get_child to a variable???
	get_child(1).shape.radius += obj_val

#func _process(delta):
#	if

#func _process(delta):
	#key w
#	if Input.is_action_pressed("forward"):
#		add_force(Vector3(0, 0, -2), Vector3(0, 0, 0))		
#	#key s
#	if Input.is_action_pressed("back"):
#		add_force(Vector3(0, 0, 2), Vector3(0, 0, 0))
#	#key d
#	if Input.is_action_pressed("right"):
#		add_force(Vector3(2, 0, 0), Vector3(0, 0, 0))
#	#key a
#	if Input.is_action_pressed("left"):
#		add_force(Vector3(-2, 0, 0), Vector3(0, 0, 0))
		
# old. handled by objects now		
#	if(collision):
#		var collider = collision.get_collider()
#		if collider.group == "object":
#			if collider.get_parent().group != "player":
#				get_parent().remove_child(collider)
#				add_child(collider)
#				collider.set_owner(self)
#				collider.set_translation(to_global(collider.global_pos))
