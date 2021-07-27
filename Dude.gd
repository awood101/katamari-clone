extends StaticBody
onready var group = "object"
onready var global_pos = global_transform.origin
onready var player = get_node("../Player")

func _ready():
	randomize()
	var r = rand_range(0.0, 1.0)
	var g = rand_range(0.0, 1.0)
	var b = rand_range(0.0, 1.0)
	for child in get_children():
		if child.get_class() == "MeshInstance":
			var mat = child.get_surface_material(0)
			mat.albedo_color = Color(r, g, b, 1.0)
			child.set_surface_material(0, mat)


func add_to_ball():
	$CollisionShape.disabled = true
	$Area/CollisionShape.disabled = true
	get_parent().remove_child(self)
	player.add_child(self)
	global_transform.origin = player.global_transform.origin + Vector3(rand_range(0.5, 1.0), rand_range(0.5, 1.0), rand_range(0.5, 1.0))
	


func _on_Area_body_entered(body):
	if body.get_class() == "RigidBody":
		if body.mesh_instance.mesh.radius > 1.5:
			add_to_ball()
			body.grow(0.05)
			$Area.set_deferred("monitoring", false)
