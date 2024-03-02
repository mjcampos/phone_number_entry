extends MarginContainer

@onready var display_container: VBoxContainer = %DisplayContainer
@onready var inputs_container: VBoxContainer = %InputsContainer

@onready var first_name_input: LineEdit = %FirstNameInput
@onready var last_name_input: LineEdit = %LastNameInput

# List out all display containers
@onready var message: Label = %Message
@onready var fact_1: Label = %Fact1
@onready var fact_2: Label = %Fact2
@onready var fact_3: Label = %Fact3
@onready var fact_4: Label = %Fact4
@onready var fact_5: Label = %Fact5
@onready var fact_6: Label = %Fact6
@onready var fact_7: Label = %Fact7
@onready var fact_8: Label = %Fact8
@onready var fact_9: Label = %Fact9
@onready var fact_10: Label = %Fact10

@onready var error_message: Label = %ErrorMessage

var facts_label_array: Array = []

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	facts_label_array = [fact_1, fact_2, fact_3, fact_4, fact_5, fact_6, fact_7, fact_8, fact_9, fact_10]
	display_container.visible = false
	inputs_container.visible = true
	error_message.visible = false

func show_facts(facts: Dictionary, phone_number_string_array: Array) -> void:
	var first_name = first_name_input.text
	var last_name = last_name_input.text
	
	message.text = "So " + first_name + " " + last_name + ", you have chosen to save your number as:"

	for index in phone_number_string_array.size():
		var string_num = phone_number_string_array[index]
		var fact = facts[string_num]
		
		facts_label_array[index].text = string_num + ", as in " + fact
	
	display_container.visible = true
	inputs_container.visible = false


func _on_reset_button_pressed() -> void:
	get_tree().reload_current_scene()
