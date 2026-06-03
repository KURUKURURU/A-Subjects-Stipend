extends Node2D
@export var progress_bar: ProgressBar 

var scene_path : String
var progress : Array
var update : float = 0.0

func _ready() -> void:
	scene_path = Loader.scene_path
	ResourceLoader.load_threaded_request(scene_path)


func _process(delta: float) -> void:
	ResourceLoader.load_threaded_get_status(scene_path, progress)
	
	progress_bar.value = progress[0]
	
	if progress[0] > update:
		update = progress[0]
	
	if progress_bar.value < update:
		progress_bar.value += delta * 0.5
	
	if progress_bar.value >= 1.0:
		get_tree().change_scene_to_packed(
			
			ResourceLoader.load_threaded_get(scene_path )
		)
