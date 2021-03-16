tool
extends RayObject
class_name RaySphere, "../icons/sphere.svg"

var shader = preload("Sphere.shader")
export var radius = 1

# Called when the node enters the scene tree for the first time.
func _ready():
	property_list_changed_notify()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
