extends Control

func _ready():
	$MainPanel/StartButton/StartLabel.text = "INITIATE"
	$MainPanel/ExitButton/ExitLabel.text = "EXIT"

func _on_StartButton_mouse_entered():
	$MainPanel/StartButton/StartLabel.text = "START"
	$MainPanel/StartButton/StartLabel.modulate = Color(170, 253, 255)
	$AudioStreamPlayer.playing = true

func _on_StartButton_mouse_exited():
	$MainPanel/StartButton/StartLabel.text = "INITIATE"
	$MainPanel/StartButton/StartLabel.modulate = Color(255, 255, 255)
	$AudioStreamPlayer.playing = false


func _on_StartButton_pressed():
	$Select.playing = true
	$AnimationPlayer.play("disappear")
	
	yield($AnimationPlayer, "animation_finished")
	
	get_tree().change_scene("res://scenes/InsertYourName.tscn")


func _on_ExitButton_pressed():
	$Select.playing = true
	
	yield($Select, "finished")
	
	get_tree().quit(0)


func _on_ExitButton_mouse_entered():
	$MainPanel/ExitButton/ExitLabel.text = "FINISH"
	$MainPanel/ExitButton/ExitLabel.modulate = Color(170, 253, 255)
	$AudioStreamPlayer.playing = true

func _on_ExitButton_mouse_exited():
	$MainPanel/ExitButton/ExitLabel.text = "EXIT"
	$MainPanel/ExitButton/ExitLabel.modulate = Color(255, 255, 255)
	$AudioStreamPlayer.playing = false
