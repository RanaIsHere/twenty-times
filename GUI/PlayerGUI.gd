extends Control

var help = false

func _ready():
	$Under/Over/DNAProgress.value = Globals.DNA
	
	if Globals.pjc_stage == 1:
		$NY.text = "Name: " + str(Globals.playerName) + "    Year: " + str(Globals.year) + "    Time Elapsed: " + str(int(Globals.stage_1_elapsed))
	elif Globals.pjc_stage == 2:
		$NY.text = "Name: " + str(Globals.playerName) + "    Year: " + str(Globals.year) + "    Time Elapsed: " + str(int(Globals.stage_2_elapsed))
	elif Globals.pjc_stage == 3:
		$NY.text = "Name: " + str(Globals.playerName) + "    Year: " + str(Globals.year) + "    Time Elapsed: " + str(int(Globals.stage_3_elapsed))

func _process(_delta):
	if $Under/Over/DNAProgress.value < Globals.DNA:
		$Under/Over/DNAProgress.value += 0.1
		if !$AnimationPlayer.is_playing():
			$AnimationPlayer.play("shine")
	else:
		$AnimationPlayer.stop()
		
	if Input.is_action_just_pressed("help"):
		if help == false:
			$HelpMenu.visible = true
			help = true
			return
			
		if help == true:
			$HelpMenu.visible = false
			
			help = false
			return
			
	if Globals.pjc_stage == 1:
		$NY.text = "Name: " + str(Globals.playerName) + "    Year: " + str(Globals.year) + "    Time Elapsed: " + str(int(Globals.stage_1_elapsed))
	elif Globals.pjc_stage == 2:
		$NY.text = "Name: " + str(Globals.playerName) + "    Year: " + str(Globals.year) + "    Time Elapsed: " + str(int(Globals.stage_2_elapsed))
	elif Globals.pjc_stage == 3:
		$NY.text = "Name: " + str(Globals.playerName) + "    Year: " + str(Globals.year) + "    Time Elapsed: " + str(int(Globals.stage_3_elapsed))
