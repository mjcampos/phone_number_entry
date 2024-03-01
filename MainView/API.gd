extends Node

@onready var http_request: HTTPRequest = %HTTPRequest
@onready var inputs_container: VBoxContainer = $"../InputsContainer"
@onready var display_container: MarginContainer = $"../DisplayContainer"

const URL = "http://numbersapi.com/"

func _ready() -> void:
	inputs_container.visible = true
	display_container.visible = false

func make_api_call(phone_number: int) -> void:
	var stringed_phone_number: String = integer_with_commas(phone_number)
	var modified_url = URL + stringed_phone_number
	
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
		
		inputs_container.visible = false
		display_container.visible = true
