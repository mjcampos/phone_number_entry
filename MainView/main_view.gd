extends Control

@onready var digit: Label = %digit
@onready var digit_2: Label = %digit2
@onready var digit_3: Label = %digit3
@onready var digit_4: Label = %digit4
@onready var digit_5: Label = %digit5
@onready var digit_6: Label = %digit6
@onready var digit_7: Label = %digit7
@onready var digit_8: Label = %digit8
@onready var digit_9: Label = %digit9
@onready var digit_10: Label = %digit10

@onready var error_message: Label = %ErrorMessage

@onready var first_name_input: LineEdit = %FirstNameInput
@onready var last_name_input: LineEdit = %LastNameInput

@onready var back_button: Button = %BackButton
@onready var save_button: Button = %SaveButton

const phone_numbers_min := 1000000000
const phone_numbers_max := 9999999999

var generated_numbers: Array = []
var digits_label_array: Array = []

@onready var api: Node = $API

func _ready() -> void:
	error_message.visible = false
	digits_label_array = [digit, digit_2, digit_3, digit_4, digit_5, digit_6, digit_7, digit_8, digit_9, digit_10]
	
func display_phone_number(phone_number: int) -> void:
	# Initialize an empty array to store digits
	var digits_array: Array = []
	
	# Convert the number to a string array
	var number_str := str(phone_number)
	
	# Iterate over each character in the string
	for i in range(number_str.length()):
		# Convert the character back to an integer and append it to the array
		digits_array.append(number_str[i])
		
	# Display digits array
	for i in digits_label_array.size():
		digits_label_array[i].text = digits_array[i]

func _on_next_button_pressed() -> void:
	var success = generate_random_phone_number_digits()
	
	if success:
		# Get recent number and pass it for display
		display_phone_number(generated_numbers[-1])
		check_if_back_button_needs_disabling()
		check_if_save_button_needs_disabling()

func generate_random_phone_number_digits() -> bool:
	# Loop until return unique array of digits
	while generated_numbers.size() <  phone_numbers_max:
		# Generate a random 10-digit number
		var random_number := randi_range(phone_numbers_min, phone_numbers_max)
		
		if random_number not in generated_numbers:
			# Save unique number
			generated_numbers.append(random_number)
			
			return true
	
	return false

func _on_back_button_pressed() -> void:
	# Clear the current number from history
	generated_numbers.pop_back()
	
	# Grab the previous number
	var previous_number = generated_numbers[-1]
	
	display_phone_number(previous_number)
	check_if_back_button_needs_disabling()
	check_if_save_button_needs_disabling()

func check_if_back_button_needs_disabling() -> void:
	back_button.disabled = false if generated_numbers.size() > 1 else true

func check_if_save_button_needs_disabling() -> void:
	save_button.disabled = false if (generated_numbers.size() and first_name_input.text.length() and last_name_input.text.length()) else true


func _on_save_button_pressed() -> void:
	var current_number = generated_numbers[-1]

	api.make_api_call(current_number)


func _on_first_name_input_text_changed(new_text: String) -> void:
	check_if_save_button_needs_disabling()


func _on_last_name_input_text_changed(new_text: String) -> void:
	check_if_save_button_needs_disabling()
