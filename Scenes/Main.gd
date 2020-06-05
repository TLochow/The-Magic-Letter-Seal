extends Node2D

var Box1Delivered = false
var Box2Delivered = false
var Box3Delivered = false
var Box4Delivered = false
var Box5Delivered = false
var Box6Delivered = false

var Letters = 6

func _init():
	randomize()

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		get_tree().quit()

func _on_Box1_body_entered(body):
	if not Box1Delivered:
		Box1Delivered = true
		$Mailboxes/Box1/Sprite.frame = 31
		CheckWon()

func _on_Box2_body_entered(body):
	if not Box2Delivered:
		Box2Delivered = true
		$Mailboxes/Box2/Sprite.frame = 31
		CheckWon()

func _on_Box3_body_entered(body):
	if not Box3Delivered:
		Box3Delivered = true
		$Mailboxes/Box3/Sprite.frame = 31
		CheckWon()

func _on_Box4_body_entered(body):
	if not Box4Delivered:
		Box4Delivered = true
		$Mailboxes/Box4/Sprite.frame = 31
		CheckWon()

func _on_Box5_body_entered(body):
	if not Box5Delivered:
		Box5Delivered = true
		$Mailboxes/Box5/Sprite.frame = 31
		CheckWon()

func _on_Box6_body_entered(body):
	if not Box6Delivered:
		Box6Delivered = true
		$Mailboxes/Box6/Sprite.frame = 31
		CheckWon()

func CheckWon():
	$Sounds/Delivered.play()
	Letters -= 1
	$CanvasLayer/UI/Letters/Label.text = str(Letters)
	if Letters == 0:
		$CanvasLayer/UI/Win.visible = true
