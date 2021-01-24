tool
extends EditorPlugin

var dock_instance : Control

func _enter_tree() -> void:
	dock_instance = load("res://addons/talk_to_ducky/DuckyDock.tscn").instance()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_RIGHT_BL, dock_instance)

func _exit_tree() -> void:
	remove_control_from_docks(dock_instance)
