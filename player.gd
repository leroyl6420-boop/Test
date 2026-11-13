extends CharacterBody2D

var score = 0

func _physics_process(delta):
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * 400
	move_and_slide()


func _on_player_hitbox_area_entered(area: Area2D) -> void:
	if area.is_in_group("Object") and not $Held_Object.visible:
		area.queue_free()
		$Held_Object.visible = true # Replace with function body.

	if area.is_in_group("Basket") and $Held_Object.visible:
		$Held_Object.visible = false
		score += 1
		$CanvasLayer/Score_Display.text = "Score: " + str(score)
