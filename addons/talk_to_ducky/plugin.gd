tool
extends EditorPlugin

var button_instance : Button
var dock_instance : Control
var dock_added : bool = false

func _enter_tree() -> void:
	dock_instance = load("res://addons/talk_to_ducky/DuckyDock.tscn").instance()
	button_instance = load("res://addons/talk_to_ducky/CallTheDuck.tscn").instance()
	add_control_to_container(EditorPlugin.CONTAINER_TOOLBAR, button_instance)
	button_instance.connect("pressed", self, "_on_duck_called")

func _exit_tree() -> void:
	if (dock_added):
		remove_control_from_docks(dock_instance)
	dock_instance.queue_free()
	
	remove_control_from_container(EditorPlugin.CONTAINER_TOOLBAR, button_instance)
	button_instance.queue_free()

func _on_duck_called() -> void:
	if (!dock_added):
		add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL, dock_instance)
		dock_added = true
	else:
		remove_control_from_docks(dock_instance)
		dock_added = false
