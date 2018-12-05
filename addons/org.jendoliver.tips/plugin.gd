tool
extends EditorPlugin

var dock = null

func _enter_tree():
	dock = preload("res://addons/org.jendoliver.tips/TipsDock.tscn").instance()
	dock.connect("remove", self, "queue_free")
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_BR, dock)

func _exit_tree():
	remove_control_from_docks(dock)
	if dock != null:
		dock.queue_free()
		dock = null
