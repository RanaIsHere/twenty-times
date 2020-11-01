extends Area2D

func _ready():
	$Particles2D.emitting = true


func _on_VirusParticle_body_entered(body):
	Globals.playerHealth = 0
