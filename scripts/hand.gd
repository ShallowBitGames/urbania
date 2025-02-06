class_name Hand extends Node

signal card_selected(card)

var card_data = {
	"CLINIC": "res://resources/cards/clinic.tres",
	"LIBRARY": "res://resources/cards/library.tres",
	"PARK": "res://resources/cards/park.tres"
}

var slots = [
	{"position" : Vector2i(0, 200), "free" : true},
	{"position" : Vector2i(-175, 200), "free" : true},
	{"position" : Vector2i(175, 200), "free" : true}]

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
			var lower_pos = s["position"]
			var upper_pos = Vector2i(lower_pos.x, lower_pos.y - 30)
			card.set_positions(lower_pos, upper_pos)
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


# 'clicked' here is selected -> should be raised, all others lowers
func card_clicked(clicked_card):
	card_selected.emit(clicked_card)
	
	for c in get_children():
		if c != clicked_card:
			c.unselect()

func get_selected_card():
	for c in get_children():
		if c.selected:
			return c
