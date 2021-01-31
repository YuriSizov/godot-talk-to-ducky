tool
extends Button

func _ready() -> void:
	var flat_style := StyleBoxEmpty.new()
	add_stylebox_override("normal", flat_style)
	add_stylebox_override("hover", flat_style)
	add_stylebox_override("focus", flat_style)
	add_stylebox_override("pressed", flat_style)
	
	rect_min_size = Vector2(rect_size.y, rect_size.y)
