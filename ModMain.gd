extends Node

# Loads the CustomStageBuilder class, for use in metadata building
onready var CustomStageBuilder = load("res://custom_stage_loader/CustomStageBuilder.gd")

var Builder
var Loader

# _init() is called when the mod is loaded
func _init(modLoader = ModLoader):
	pass

func _ready():
	# We call the build_stage() function after the game's process queue clears up
	# This is to ensure no errors occur.
	call_deferred("build_stage")

# Here is where the stage building takes place.
func build_stage():
	
	Builder = CustomStageBuilder.new() # For building the stage metadata
	Loader = get_tree().get_root().get_node("CSL"); # For loading the stage itself

	Builder.data.stage_name = "Temple Thing";
	Builder.data.stage_icon = "res://SDM_ClockTower/icon.png"; 

	# Ground
	Builder.make_background("GroundBackground", { # Creating a background to hold our ground layers
		"layer": 1, # index
	});

	Builder.make_layer("GroundLayer", Builder.get_material_id("GroundBackground")); 

	Builder.make_element("Ground", Builder.get_material_id("GroundLayer"), { 
		"frames": Builder.make_spriteframes_image("res://SDM_ClockTower/layers/assets/ground.png"),
		"position": Vector2(0, 75),
		"h_tile": true,
	});

	# Clocktower
	#Builder.make_element("Clocktower", Builder.get_material_id("GroundLayer"), { 
		#"frames": Builder.make_spriteframes_image("res://SDM_ClockTower/layers/assets/clocktower.png"),
		#"position": Vector2(0, -460),
	#});

	# Clouds
	Builder.make_background("SkyBackground", { # Creating a background to hold our ground layers, 
		"layer": 0, # index
		#"bg_color": Color("#68a5e3")
	});

	Builder.make_layer("CloudsLayer", Builder.get_material_id("SkyBackground"), {
	});

	# Clouds layer 1
	Builder.make_element("Clouds1", Builder.get_material_id("CloudsLayer"), {
		"active": true,
		"ticks_per_frame": 30,
		"frames": Builder.make_spriteframes_animation("res://SDM_ClockTower/layers/sky/"),
		"position": Vector2(0, -25),
		"h_tile": true,
	});

	# Clouds layer 2
	Builder.make_element("Clouds2", Builder.get_material_id("CloudsLayer"), {
		"active": true,
		"ticks_per_frame": 40,
		"frames": Builder.make_spriteframes_animation("res://SDM_ClockTower/layers/sky/"),
		"position": Vector2(0, -270),
		"h_tile": true,
	});

	# Clouds layer 3
	Builder.make_element("Clouds2", Builder.get_material_id("CloudsLayer"), {
		"active": true,
		"ticks_per_frame": 50,
		"frames": Builder.make_spriteframes_animation("res://SDM_ClockTower/layers/sky/"),
		"position": Vector2(0, -520),
		"h_tile": true,
	});

	# Clouds layer 2
	Builder.make_element("Clouds2", Builder.get_material_id("CloudsLayer"), {
		"active": true,
		"ticks_per_frame": 40,
		"frames": Builder.make_spriteframes_animation("res://SDM_ClockTower/layers/sky/"),
		"position": Vector2(0, -270),
		"h_tile": true,
	});

	# Clouds layer 4
	Builder.make_element("Clouds2", Builder.get_material_id("CloudsLayer"), {
		"active": true,
		"ticks_per_frame": 50,
		"frames": Builder.make_spriteframes_animation("res://SDM_ClockTower/layers/sky/"),
		"position": Vector2(0, -770),
		"h_tile": true,
	});

	# Clouds layer 5
	Builder.make_element("Clouds2", Builder.get_material_id("CloudsLayer"), {
		"active": true,
		"ticks_per_frame": 60,
		"frames": Builder.make_spriteframes_animation("res://SDM_ClockTower/layers/sky/"),
		"position": Vector2(0, -1020),
		"h_tile": true,
	});

	

	Loader.add_stage(Builder.data);
