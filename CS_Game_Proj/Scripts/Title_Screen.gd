extends Control

var scene_path_to_load

# Called when the node enters the scene tree for the first time.
func _ready():
	for button in $menu/Center_Row/Buttons.get_children():
		button.connect("pressed", self, "_on_button_pressed", [button.scene_to_load])

func _on_button_pressed(scene_to_load):
	scene_path_to_load = scene_to_load
	#$Fade_In.show()
	#$Fade_In.fade_in()

func _on_Fade_In_fade_finished():
	get_tree().change_scene(scene_path_to_load)
