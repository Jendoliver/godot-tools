tool
extends WindowDialog

onready var tip = $text

var tips = {}

func _ready():
	var file = File.new()
	file.open("res://addons/org.jendoliver.tips/tips.json", file.READ)
	var text = file.get_as_text()
	file.close()
	var data_parse = JSON.parse(text)
	if data_parse.error != OK:
		return
	tips = data_parse.result
	randomize()

func pop(id):
	if tips.empty():
		return
	tip.text = tips[id].tip
	popup()

func pop_random():
	pop(randi(0 % tips.size()))

func _on_btn_accept_pressed():
	hide()
