extends Control

var oneshot = 0

func _ready():
	$TextBoxIO.visible = false
	$"2020".visible = false
	Globals.stage = 2
	print(Globals.playerName)
	
	$startTimer.start()

func _process(_delta):
	if Globals.year == "2020":
		if oneshot == 0:
			oneshot += 1
			$endTimer.start()

func _on_startTimer_timeout():
	$TextBoxIO.visible = true
	$"2020".visible = true


func _on_endTimer_timeout():
	$TextBoxIO.visible = false
	
	$changeTimer.start()


func _on_changeTimer_timeout():
	get_tree().change_scene("res://scenes/MainGame.tscn")
