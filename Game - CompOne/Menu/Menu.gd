extends Control

func _ready():
	# Arrow key Control
	$VBoxContainer/StartButton.grab_focus()

# Move player into scene 1 
func _on_StartButton_pressed():
	get_tree().change_scene("res://Scenes/World.tscn")

func _on_QuitButton_pressed():
	get_tree().quit()


func _on_ControlsButton_pressed():
	get_tree().change_scene("res://Scenes/PlayerControls.tscn")
