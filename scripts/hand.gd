class_name Hand extends Node

var card_data = {
	"CLINIC": "res://resources/cards/clinic.tres",
	"LIBRARY": "res://resources/cards/library.tres",
	"PARK": "res://resources/cards/park.tres"
}

var slots = [
	{"position" : Vector2i(0, 200), "free" : true},
	{"position" : Vector2i(-200, 200), "free" : true},
	{"position" : Vector2i(200, 200), "free" : true}]

var card_deck = []

var card_scene = preload("res://card.tscn")

@onready var card1 = $CardArea/CollisionShape2D/Card
@onready var card2 = $CardArea/CollisionShape2D/Card2
@onready var card3 = $CardArea/CollisionShape2D/Card3

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

func load_card(cardID) -> Card:
	var datapath = card_data[cardID]
	var data = load(datapath)
	
	var card = card_scene.instantiate()
	card.set_data(data)
	return card

func add_card(cardID):
	#var card_data = load_card_data(cardID)
	#cards_held.append(card)
	var card = load_card(cardID)
	for s in slots:
		if s["free"]:
			add_child(card)
			card.set_position(s["position"])
			s["free"] = false
			break

func card_count():
	var count = 0
	for s in slots:
		if !s["free"]:
			count += 1
	return count

func remove_card(cardID):
	pass
