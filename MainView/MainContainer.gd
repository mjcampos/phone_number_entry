extends MarginContainer

@onready var display_container: VBoxContainer = %DisplayContainer
@onready var inputs_container: VBoxContainer = %InputsContainer

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_container.visible = false
	inputs_container.visible = true
