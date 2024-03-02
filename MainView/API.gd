extends Node

@onready var main_container: MarginContainer = %MainContainer
@onready var save_button: Button = %SaveButton
@onready var error_message: Label = %ErrorMessage

const repo = { 
	"0": "the coldest possible temperature old the Kelvin scale", 
	"1": "the number of dimensions of a line", 
	"2": "the lowest channel of television in the United States, Canada, Argentina and Mexico on which television signals are broadcast", 
	"3": "the number of witches in William Shakespeare's Macbeth", 
	"4": "the number of legs most furniture has", 
	"5": "the number of completed, numbered piano concertos of Ludwig van Beethoven, Sergei Prokofiev, and Camille Saint-Saëns", 
	"6": "the number of points on a Star of David", 
	"7": "the number of types of viruses according to the Baltimore classification", 
	"8": "the number of furlongs in a mile", 
	"9": "the number of circles of Hell in Dante's Divine Comedy" 
}

func make_api_call(phone_number: int) -> void:
	var phone_number_array = integer_to_digit_array(phone_number)
	var random_number_facts = {}
	
	for number_string in phone_number_array:
		random_number_facts[number_string] = repo[number_string]
	
	main_container.show_facts(random_number_facts, phone_number_array)

func integer_to_digit_array(number: int) -> Array:
	var number_str = str(number)  # Convert integer to string
	var digit_array = []  # Initialize array to store digits

	# Iterate over each character in the string
	for i in range(number_str.length()):
		# Append each character (digit) to the array as a string
		digit_array.append(number_str[i])

	return digit_array
