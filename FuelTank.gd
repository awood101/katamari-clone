extends StaticBody
onready var group = "object"
onready var global_pos = global_transform.origin
onready var player = get_node("../Player")


func add_to_ball():
	$CollisionShape.disabled = true
	$Area/CollisionShape.disabled = true
	get_parent().remove_child(self)
	player.add_child(self)
	global_transform.origin = player.global_transform.origin
	


func _on_Area_body_entered(body):
	if body.get_class() == "RigidBody":
		add_to_ball()
		body.grow(0.1)
		$Area.set_deferred("monitoring", false)
