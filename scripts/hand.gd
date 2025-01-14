class_name Hand extends Node

var card_data = {
	1: {name: "Housing"},
	2: {name: "Clinic"},
	3: {name: "Library"},
	4: {name: "Park"}
}

var card_deck = []
var cards_held = []

var card_scene = preload("res://card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cards_held = []

func add_card(cardID):
	#var card_data = load_card_data(cardID)
	#cards_held.append(card)
	var card = card_scene.instantiate()
	
	pass

func remove_card(cardID):
	pass
