extends Node

@onready var http_request: HTTPRequest = %HTTPRequest
@onready var main_container: MarginContainer = %MainContainer
@onready var save_button: Button = %SaveButton
@onready var error_message: Label = %ErrorMessage

const URL = "http://numbersapi.com/"
const suffix = "/trivia?fragment"

var phone_number_array: Array

func make_api_call(phone_number: int) -> void:
	var stringed_phone_number: String = integer_with_commas(phone_number)
	var modified_url = URL + stringed_phone_number + suffix
	
	phone_number_array = integer_to_digit_array(phone_number)
	save_button.disabled = true
	error_message.visible = false
	
	$HTTPRequest.request(modified_url)

func integer_with_commas(number: int) -> String:
	var number_str = str(number)  # Convert integer to string
	var result = ""  # Initialize result string
	
	# Iterate over each character in the string
	for i in range(number_str.length()):
		# Append character to result string
		result += number_str[i]
		
		# Add comma if it's not the last character
		if i < number_str.length() - 1:
			result += ","
	
	return result

func integer_to_digit_array(number: int) -> Array:
	var number_str = str(number)  # Convert integer to string
	var digit_array = []  # Initialize array to store digits

	# Iterate over each character in the string
	for i in range(number_str.length()):
		# Append each character (digit) to the array as a string
		digit_array.append(number_str[i])

	return digit_array

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	save_button.disabled = false
	
	if response_code == 200:
		# Parse the returned body
		var random_number_facts = JSON.parse_string(body.get_string_from_utf8())
		
		main_container.show_facts(random_number_facts, phone_number_array)
	else:
		print("We have a problem")
		error_message.visible = true
