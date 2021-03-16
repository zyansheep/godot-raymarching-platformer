extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	$Level.gen_level_shader()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

var position = Vector3(0,0,0)
var rotation = Vector3(0,0,0)
var speed = 10.0

func _physics_process(_delta):
	var camera = $Level/Camera
	var shader = $Canvas.material;
	position = camera.get_camera_transform().origin
	rotation = - camera.get_camera_transform().basis.z.normalized()
	$Control/Coordinates.text = str(position)
	$Control/Speed.text = str(speed)
	shader.set_shader_param("cameraPos", position)
	shader.set_shader_param("front", rotation)
	
	#shader.set_shader_param("transform", $Level/RaySphere.global_transform)
	shader.set_shader_param("color", Vector3(255,0,255))
	
	if Input.is_action_just_released("speed_up"):
		speed += speed/2;
		var ls = speed
		camera.max_speed = Vector3(ls,ls,ls)
	if Input.is_action_just_released("speed_down"):
		speed -= speed/2;
		var ls = speed
		camera.max_speed = Vector3(ls,ls,ls)
	
	if Input.is_key_pressed(KEY_R):
		camera.translation = Vector3(0,0,0)
	#let color = $"../ColorPicker".color;
	#self.material.set_shader_param("lightColor", color)
