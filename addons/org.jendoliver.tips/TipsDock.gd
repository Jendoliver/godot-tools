tool
extends Panel

signal remove

onready var tip = $tip

func _ready():
	tip.pop(0)

func _on_random_tip_pressed():
	tip.pop(0)

func _on_hide_dock_pressed():
	emit_signal("remove")
