extends Control

func _ready():
	$Box/LineEdit.editable = true

func _on_LineEdit_text_entered(new_text):
	if Globals.stage == 1:
		Globals.playerName = new_text
		$Box/LineEdit.editable = false
	if Globals.stage == 2:
		if new_text == "2020":
			Globals.year = new_text
			$Box/LineEdit.editable = false
		else:
			$AudioStreamPlayer.playing = true
			$Box/LineEdit.clear()
		
