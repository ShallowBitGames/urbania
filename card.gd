extends Area2D
class_name Card

signal card_selected

const ATTRIBUTES = preload("res://resources/cardData.gd")

var attributes : CardData

var selected = false

var lower_position
var upper_position

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		print("Clicked card: " + attributes.name)

func set_positions(lower_pos, upper_pos):
	lower_position = lower_pos
	upper_position = upper_pos

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
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func unselect():
	selected = false
	position = lower_position
	pass

func select():
	selected = true
	pass

func on_click() -> void:
	
	if selected:
		unselect()
	else:
		select()
		card_selected.emit()
		
