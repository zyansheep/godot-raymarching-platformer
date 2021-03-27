tool
extends Spatial
class_name RayObject, "icons/ray_marching.png"

export(Shader) var distance_function;

func _ready():
	pass # Replace with function body.

# Returns built sdf function calculated subobjects and preset distance_function
func get_shader_text():
	return gen_self_unique_sdf()
#	for child in self.get_children():
#		if child.has_
#	if self.get_child_count() > 0:
#		print("Calculating subrayobject function")
#		return ""
#	else:
		

func gen_self_unique_sdf():
	var distance_text = self.distance_function.code
	distance_text = distance_text.replace("shader_type canvas_item;\n\n", "")
	distance_text = distance_text.replace("mainSDF", "sdf_" + String(self.get_instance_id()) )
	# ("Returning distance function: ", distance_text)
	return distance_text
