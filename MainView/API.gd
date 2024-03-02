extends Node

@onready var http_request: HTTPRequest = %HTTPRequest
@onready var main_container: MarginContainer = %MainContainer

const URL = "http://numbersapi.com/"
const suffix = "/trivia?fragment"

func make_api_call(phone_number: int) -> void:
	var stringed_phone_number: String = integer_with_commas(phone_number)
	var modified_url = URL + stringed_phone_number + suffix
	
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

func _on_http_request_request_completed(result: int, response_code: int, headers: PackedStringArray, body: PackedByteArray) -> void:
	if response_code == 200:
		# Parse the returned body
		var random_number_facts = JSON.parse_string(body.get_string_from_utf8())
		
		main_container.show_facts(random_number_facts)
	else:
		print("We have a problem")
