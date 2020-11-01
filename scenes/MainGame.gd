extends Control

func _ready():
	Globals.stage = 3
	Globals.pickedStage = 0
	
	$AnimationPlayer.play("appear")
	
func _process(_delta):
	if Globals.savedPeople == 30 or Globals.savedPeople >= 30:
		Globals.isGameFinished = true
	
	if Globals.pjc_stage == 1:
		$RightScreen/P_Stage_1.visible = true
		$RightScreen/J_Stage_2.visible = false
		$RightScreen/C_Stage_3.visible = false
	elif Globals.pjc_stage == 2:
		$RightScreen/P_Stage_1.visible = false
		$RightScreen/J_Stage_2.visible = true
		$RightScreen/C_Stage_3.visible = false
	elif Globals.pjc_stage == 3:
		$RightScreen/P_Stage_1.visible = false
		$RightScreen/J_Stage_2.visible = false
		$RightScreen/C_Stage_3.visible = true
		
	if Globals.worldCond == "bad":
		$MidScreen/YearLabel.text = "2020\nBAD"
	elif Globals.worldCond == "mediocre":
		$MidScreen/YearLabel.text = "2020\nMEDIOCRE"
	elif Globals.worldCond == "good":
		$MidScreen/YearLabel.text = "2020\nGOOD"


func _on_Finish_mouse_entered():
	$Hover_1.playing = true
	if Globals.savedPeople == 30 or Globals.savedPeople >= 30:
		if Globals.worldCond == "good":
			$MidScreen/Finish/FinishLabel.text = "END"
	else:
		$MidScreen/Finish/FinishLabel.text = "LOCKED"


func _on_Finish_mouse_exited():
	$MidScreen/Finish/FinishLabel.text = "FINISH"
	$Hover_1.playing = false


func _on_Initiate_mouse_entered():
	$Hover_1.playing = true
	if Globals.pickedStage != 0:
		$MidScreen/Initiate/InitiateLabel.text = "START"
	else:
		$MidScreen/Initiate/InitiateLabel.text = "PICK\nSTAGE"


func _on_Initiate_mouse_exited():
	$MidScreen/Initiate/InitiateLabel.text = "INITIATE"
	$Hover_1.playing = false


func _on_P_Stage_1_pressed():
	Globals.pickedStage = 1
	$RightScreen/P_Stage_1.modulate = Color(1, 1, 1, 0.5)
	$Select_1.playing = true


func _on_Initiate_pressed():
	if Globals.pickedStage != 0:
		$Select_1.playing = true
		
		match Globals.pickedStage:
			1:
				get_tree().change_scene("res://scenes/stage_1.tscn")
			2:
				get_tree().change_scene("res://scenes/stage_2.tscn")
			3:
				get_tree().change_scene("")
	else:
		$Incorrect.playing = true


func _on_J_Stage_2_pressed():
	Globals.pickedStage = 2
	$RightScreen/J_Stage_2.modulate = Color(1, 1, 1, 0.5)
	$Select_1.playing = true
