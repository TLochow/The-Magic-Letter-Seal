extends Node2D

func _ready():
	var colorNumber = randi() % 11
	var color = Color.white
	match colorNumber:
		0:
			color = Color.red
		1:
			color = Color.green
		2:
			color = Color.blue
		3:
			color = Color.orange
		4:
			color = Color.greenyellow
		5:
			color = Color.blueviolet
		6:
			color = Color.violet
		7:
			color = Color.aquamarine
		8:
			color = Color.pink
		9:
			color = Color.turquoise
	$AnimatedSprite.modulate = color
	$AnimatedSprite.frame = randi() % 2
	$AnimatedSprite.speed_scale = rand_range(0.75, 1.25)
