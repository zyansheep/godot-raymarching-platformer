#tool
#extends Control
#
#var zoom_level := 0
#var is_panning = false
#var pan_center: Vector2
#var viewport_center: Vector2
#var view_mode_index := 0
#
#var editor_interface: EditorInterface # Set in node25d_plugin.gd
#var moving = false
#
#onready var viewport_3d = $Viewport3D
#onready var viewport_overlay = $ViewportOverlay
#
#func _ready():
#	pass
#
#
#func _process(delta):
#	pass
#
#
## This only accepts input when the mouse is inside of the 2.5D viewport.
#func _gui_input(event):
#	if event is InputEventMouseButton:
#		if event.is_pressed():
#			if event.button_index == BUTTON_WHEEL_UP:
#				zoom_level += 1
#				accept_event()
#			elif event.button_index == BUTTON_WHEEL_DOWN:
#				zoom_level -= 1
#				accept_event()
#			elif event.button_index == BUTTON_MIDDLE:
#				is_panning = true
#				pan_center = viewport_center - event.position
#				accept_event()
#			elif event.button_index == BUTTON_LEFT:
#				var overlay_children = viewport_overlay.get_children()
#				for overlay_child in overlay_children:
#					overlay_child.wants_to_move = true
#				accept_event()
#		elif event.button_index == BUTTON_MIDDLE:
#			is_panning = false
#			accept_event()
#		elif event.button_index == BUTTON_LEFT:
#			var overlay_children = viewport_overlay.get_children()
#			for overlay_child in overlay_children:
#				overlay_child.wants_to_move = false
#			accept_event()
#	elif event is InputEventMouseMotion:
#		if is_panning:
#			viewport_center = pan_center + event.position
#			accept_event()
#
#
#func _recursive_change_view_mode(current_node):
#	if current_node.has_method("set_view_mode"):
#		current_node.set_view_mode(view_mode_index)
#	for child in current_node.get_children():
#		_recursive_change_view_mode(child)
#
#
#func _get_zoom_amount():
#	var zoom_amount = pow(1.05476607648, zoom_level) # 13th root of 2
#	# zoom_label.text = str(round(zoom_amount * 1000) / 10) + "%"
#	return zoom_amount
#
#
#func _on_ZoomOut_pressed():
#	zoom_level -= 1
#
#
#func _on_ZoomIn_pressed():
#	zoom_level += 1
#
#
#func _on_ZoomReset_pressed():
#	zoom_level = 0
