extends Node2D

var enemy_scene = load("res://Scenes/Enemy1.tscn")
var boss_scene = load("res://Scenes/Boss.tscn")
var spawn_timer = null
var count = 10
var bossCount = 5
var can_spawn = true;

func _ready():
	$Timer.set_wait_time(2)
	$Timer.start()

func _on_Timer_timeout():
	if(count == 0):
		print("Spawning stopped")
		
		for i in range(5):
			bossCount = bossCount - 1
		if(bossCount == 0):
			print("Spawning boss")
			var boss = boss_scene.instance()
			add_child(boss)
	else:
		print("Spawning enemy.")
		var enemy = enemy_scene.instance()
		randomize()
		enemy.position.x = rand_range(-200, 200)
		add_child(enemy)
		count = count - 1
