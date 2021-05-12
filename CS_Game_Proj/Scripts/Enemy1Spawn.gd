extends Node2D

var enemy1_scene = load("res://Scenes/Enemy1.tscn")
var enemy2_scene = load("res://Scenes/Enemy2.tscn")
var boss_scene = load("res://Scenes/Boss.tscn")

var spawn_timer = 2

var count = 30
var bossCount = 10
var can_spawn = true;

func _ready():
	$Timer.set_wait_time(spawn_timer)
	$Timer.start()

func _on_Timer_timeout():
	if(count == 0 && !$Area2D.overlaps_body(enemy1_scene.instance()) && !$Area2D.overlaps_body(enemy2_scene.instance())):
		print("Spawning stopped")
		
		for i in range(5):
			bossCount = bossCount - 1
		if(bossCount == 0):
			print("Spawning boss")
			var boss = boss_scene.instance()
			boss.position.x = 300
			add_child(boss)
	elif(count == 10):
		var enemy2_1 = enemy2_scene.instance()
		enemy2_1.position.x = 150
		add_child(enemy2_1)
			
		var enemy2_2 = enemy2_scene.instance()
		enemy2_2.position.x = 300
		add_child(enemy2_2)
			
		var enemy2_3 = enemy2_scene.instance()
		enemy2_3.position.x = 450
		add_child(enemy2_3)
		
		print("Spawning enemy.")
		var enemy1 = enemy1_scene.instance()
		randomize()
		enemy1.position.x = rand_range(0, 600)
		
		add_child(enemy1)
		count = count - 1
		print(count)
	else:
		print("Spawning enemy.")
		var enemy1 = enemy1_scene.instance()
		randomize()
		enemy1.position.x = rand_range(0, 600)
		
		add_child(enemy1)
		count = count - 1
		print(count)
