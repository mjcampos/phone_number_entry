extends Control

@export_file(".tscn") var file_path


func _on_new_entry_button_pressed() -> void:
	get_tree().change_scene_to_file(file_path)


func _on_credits_button_pressed() -> void:
	get_tree().change_scene_to_file("res://Credits/credits.tscn")
