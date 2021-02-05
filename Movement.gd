extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

var position = Vector3(0,0,0)
var rotation = Vector3(0,0,0)


func _physics_process(delta):
	var camera = $Level/Camera
	var shader = $Canvas.material;
	position = camera.get_camera_transform().origin
	rotation = - camera.get_camera_transform().basis.z.normalized()
	$Control/Coordinates.text = str(position)
	shader.set_shader_param("cameraPos", position)
	shader.set_shader_param("front", rotation)
	
	#let color = $"../ColorPicker".color;
	#self.material.set_shader_param("lightColor", color)
		
	
