extends StaticBody
onready var group = "object"
onready var global_pos = global_transform.origin
onready var player = get_node("../Player")


func add_to_ball():
	$CollisionShape.disabled = true
	$Area/CollisionShape.disabled = true
	get_parent().remove_child(self)
	player.add_child(self)
	global_transform.origin = player.global_transform.origin + Vector3(rand_range(0.5, 1.0), rand_range(0.5, 1.0), rand_range(0.5, 1.0))
	rotate_z(rand_range(10, 90))
	rotate_y(rand_range(10, 90))


func _on_Area_body_entered(body):
	if body.get_class() == "RigidBody":
		if body.mesh_instance.mesh.radius > 1.5:
			add_to_ball()
			body.grow(0.04)
			$Area.set_deferred("monitoring", false)
