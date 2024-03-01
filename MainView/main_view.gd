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

var generated_numbers: Array = []
var digits_label_array: Array = []

func _ready() -> void:
	digits_label_array = [digit, digit_2, digit_3, digit_4, digit_5, digit_6, digit_7, digit_8, digit_9, digit_10]

func _on_next_button_pressed() -> void:
	var digits_array = generate_random_phone_number_digits()
	
	for i in digits_label_array.size():
		digits_label_array[i].text = str(digits_array[i])

func generate_random_phone_number_digits():
	# Initialize an empty array to store digits
	var digits_array: Array = []
	
	# Loop until return unique array of digits
	while true:
		# Generate a random 10-digit number
		var random_number := randi_range(1000000000, 9999999999)
		
		if random_number not in generated_numbers:
			# Save unique number
			generated_numbers.append(random_number)
			
			# Conver the number to a string
			var number_str := str(random_number)
			
			# Iterate over each character in the string
			for i in range(number_str.length()):
				# Convert the character back to an integer and append it to the array
				digits_array.append(number_str[i].to_int())
				
			return digits_array
