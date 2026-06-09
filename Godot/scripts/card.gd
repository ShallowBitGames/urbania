extends Area2D
class_name Card

signal card_clicked(card)

const ATTRIBUTES = preload("res://resources/cardData.gd")

var attributes : CardData

var selected = false

var lower_position
var upper_position

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		print("click")
		if selected:
			unselect()
		else:
			select()
			card_clicked.emit(self)

func set_positions(lower_pos, upper_pos):
	lower_position = lower_pos
	upper_position = upper_pos
	position = lower_position

func set_data(resource: CardData):
	attributes = resource
	var image = Image.load_from_file(attributes.sprite_path)
	$Sprite.texture = ImageTexture.create_from_image(image)

func is_empty():
	return attributes == null

func is_selected():
	return selected

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unselect():
	selected = false
	position = lower_position

func select():
	selected = true
	position = upper_position
	get_parent().card_clicked(self)
