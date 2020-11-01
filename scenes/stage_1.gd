extends Node2D

#var timeElapsedCurrent = 0
var stageComplete = false
var oneshot = 0

func _ready():
	Globals.DNA = 0
	Globals.stage_1_elapsed = 0
	
	$Player.global_position = $CheckpointSprite/checkPoint.global_position
	
func _process(delta):
	var tm = $TileMap.world_to_map($Player/detectorWorldEnv.global_position)
	var tl = $TileMap.get_cellv(Vector2(tm.x, tm.y))
	
	#print(tl)

	
	if tl == 1:
		Globals.playerHealth = 0
		
	if Globals.playerHealth == 0 or Globals.playerHealth <= 0:
		$Player.global_position = $CheckpointSprite/checkPoint.global_position
		Globals.playerHealth = 100
		
	if Globals.stage_1_elapsed < 99999:
		Globals.stage_1_elapsed += delta
		print(Globals.stage_1_elapsed)
	
	if Globals.DNA == 100 or Globals.DNA >= 100:
		stageComplete = true
		
	if stageComplete == true:
		if oneshot == 0:
			oneshot += 1
			
			Globals.savedPeople = 10
			Globals.worldCond = "mediocre"
			Globals.pjc_stage = 2
			changescene()
	
	#print(Globals.stage_1_elapsed)

func changescene():
	$AnimationPlayer.play("vanish")
	
	yield($AnimationPlayer, "animation_finished")
	
	get_tree().change_scene("res://scenes/MainGame.tscn")

func _on_CheckPointSecond_body_entered(body):
	if body.name == "Player":
		$CheckpointSprite.global_position = $CheckPointSecond/AnimatedSprite.global_position
		
		$CheckPointSecond.queue_free()


func _on_CheckPointThird_body_entered(body):
	if body.name == "Player":
		$CheckpointSprite.global_position = $CheckPointThird/AnimatedSprite.global_position
		$CheckPointThird.queue_free()
