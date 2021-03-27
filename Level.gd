extends Node


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var original_shader_code = preload("res://Main.shader").code;

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func gen_level_shader():
	var regex = RegEx.new()
	regex.compile("""\/\/ SDF START(.|\n)*SDF END""")
	
	var child_combine_func = "vec4(0.,0.,0.,100000000.0)";
	var replacement_sdf = ""
	for child in self.get_children():
		if child.has_method("get_shader_text"):
			child_combine_func = "opU(" + child_combine_func + ", " + "sdf_" + String(child.get_instance_id()) + "(p))"
			var child_shader_text = child.get_shader_text();
			print(child_shader_text)
			replacement_sdf += ("\n" + child_shader_text)
	
	replacement_sdf += "\nvec4 sdf(vec3 p) {\n\treturn " + child_combine_func + ";\n}";
	
	var shader_text = regex.sub(original_shader_code, replacement_sdf, true);
#	print(shader_text)
	$"../Canvas".material.shader.code = shader_text;
	
	var line_num = 0;
	for line in shader_text.split("\n"):
		line_num += 1;
		print(String(line_num) + "	" + line)
	#shader_text.replace()
	#get_tree().quit()
