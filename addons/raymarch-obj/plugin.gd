tool
extends EditorPlugin

func _enter_tree():
	add_custom_type("RayObject", "Spatial", preload("rayobject.gd"), preload("icons/ray_marching.png"))
	add_custom_type("RaySphere", "RayObject", preload("objects/sphere.gd"), preload("icons/sphere.svg"))

func _exit_tree():
	remove_custom_type("RayObject")
	remove_custom_type("RaySphere")
