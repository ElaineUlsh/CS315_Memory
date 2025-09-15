extends Node2D

var cards_selected : Array
var cards_match = false

func _ready() -> void:
	cards_selected = []

func card_clicked(selected_card):
	$FlipTimer.start()
	cards_selected.append(selected_card)
	
	if cards_selected.size() >= 2:
		if cards_selected[0].card_value == cards_selected[1].card_value:
			cards_match = true
		else:
			cards_match = false
		pass


func _on_flip_timer_timeout() -> void:
	if cards_match:
		cards_selected[0].queue_free()
		cards_selected[1].queue_free()
	else:
		cards_selected[0].flip_over()
		cards_selected[1].flip_over()
	cards_selected = []
	pass # Replace with function body.
