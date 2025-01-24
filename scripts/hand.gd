class_name Hand extends Node



var card_data = {
	"HOUSING": {name: "Housing", data: },
	"CLINIC": {name: "Clinic", data: "res://resources/cards/clinic.tres"},
	"LIBRARY": {name: "Library", data: "res://resources/cards/library.tres"},
	"PARK": {name: "Park", data: "res://resources/cards/park.tres"}
}

var card_deck = []
var cards_held = []

var card_scene = preload("res://card.tscn")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	cards_held = []

var card_clinic = load()
	var card_library = load()
	var card_park = load()
	 
	$CardArea/CollisionShape2D/Card.set_data(card_clinic)
	$CardArea/CollisionShape2D/Card2.set_data(card_library)
	$CardArea/CollisionShape2D/Card3.set_data(card_park)

func add_card(cardID):
	#var card_data = load_card_data(cardID)
	#cards_held.append(card)
	var card = card_scene.instantiate()
	
	pass

func remove_card(cardID):
	pass
