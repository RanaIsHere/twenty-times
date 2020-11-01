extends Area2D

func _ready():
	$AnimatedSprite/Label.visible = false
	$AnimationPlayer.play("default")

func _on_DNA_body_entered(body):
	if body.name == "Player":
		Globals.DNA += 10
		queue_free()


func _on_DNA_mouse_entered():
	$AnimatedSprite/Label.visible = true

func _on_DNA_mouse_exited():
	$AnimatedSprite/Label.visible = false
