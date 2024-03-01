extends Control

var generated_numbers: Array = []

func _on_next_button_pressed() -> void:
	print(generate_random_phone_number_digits())

func generate_random_phone_number_digits():
	# Initialize an empty array to store digits
	var digits_array = []
	
	# Loop until return unique array of digits
	while true:
		# Generate a random 10-digit number
		var random_number = randi_range(1000000000, 9999999999)
		
		if random_number not in generated_numbers:
			# Save unique number
			generated_numbers.append(random_number)
			
			# Conver the number to a string
			var number_str = str(random_number)
			
			# Iterate over each character in the string
			for i in range(number_str.length()):
				# Convert the character back to an integer and append it to the array
				digits_array.append(number_str[i].to_int())
				
			return digits_array
