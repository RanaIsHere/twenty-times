extends Control

var oneshot = 0

func _ready():
	Globals.stage = 1
	$hello.visible = false
	$startUp.start()

func _process(_delta):
	if Globals.playerName != null:
		if $Timer.is_stopped():
			if oneshot == 0:
				oneshot += 1
				$Timer.start()

func _on_AnimationPlayer_animation_finished(anim_name):
	if anim_name == "appear":
		$BackgroundP.visible = false
		$BackgroundC.visible = true
		
		$textBox.start()

func _on_startUp_timeout():
	$AnimationPlayer.play("appear")


func _on_Timer_timeout():
	$TextBoxIO.visible = false
	$TextBoxIO.queue_free()
	$hello.text = "H E L L O, " + str(Globals.playerName) 
	$hello.visible = true
	
	$changeTimer.start()

func _on_textBox_timeout():
	$textBox.queue_free()
	$TextBoxIO.visible = true


func _on_changeTimer_timeout():
	get_tree().change_scene("res://scenes/InsertCurrentYear.tscn")
