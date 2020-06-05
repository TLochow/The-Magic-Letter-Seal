extends KinematicBody2D

var Motion = Vector2(0.0, 0.0)

var Size = 2.5

onready var BaseSpriteScale = $Sprite.scale
onready var BaseZoom = $Camera2D.zoom
onready var BaseCollision = $CollisionShape2D.shape.extents
onready var BaseCanGrow = $CanGrow/CollisionShape2D.shape.extents

func _physics_process(delta):
	Motion.y += 600.0 * delta * Size
	
	Motion.x = 0.0
	var moving = false
	if Input.is_action_pressed("ui_left"):
		Motion.x -= 100.0 * Size
		$Sprite.flip_h = true
		moving = true
	if Input.is_action_pressed("ui_right"):
		Motion.x += 100.0 * Size
		$Sprite.flip_h = false
		moving = true
	if Input.is_action_just_pressed("ui_up"):
		if is_on_floor():
			Motion.y = -300.0 * Size
	
	Motion = move_and_slide(Motion, Vector2(0.0, -1.0))
	
	if moving:
		SwitchAnimation("Walk")
	else:
		SwitchAnimation("Idle")
	
	var canGrow = $CanGrow.get_overlapping_bodies().size() == 0
	if Input.is_action_pressed("grow") and canGrow:
		Size = lerp(Size, 5.0, delta * 0.5)
	if Input.is_action_pressed("shrink"):
		Size = lerp(Size, 0.1, delta * 2.0)
	
	$Sprite.scale = BaseSpriteScale * Size
	$Camera2D.zoom = BaseZoom * Size
	$CollisionShape2D.shape.extents = BaseCollision * Size
	$CanGrow/CollisionShape2D.shape.extents = BaseCanGrow * Size

func SwitchAnimation(animation):
	if $AnimationPlayer.current_animation != animation:
		$AnimationPlayer.play(animation)
