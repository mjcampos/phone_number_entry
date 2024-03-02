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


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	display_container.visible = false
	inputs_container.visible = true

func show_facts(facts: Dictionary) -> void:
	var first_name = first_name_input.text
	var last_name = last_name_input.text
	
	message.text = "So " + first_name + " " + last_name + ", your number is as follows:"
	
	display_container.visible = true
	inputs_container.visible = false
	
	print(facts)
	print(first_name)
	print(last_name)
