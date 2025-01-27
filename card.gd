extends Area2D
class_name Card

const ATTRIBUTES = preload("res://resources/cardData.gd")

var attributes : CardData

func _input_event(viewport: Viewport, event: InputEvent, shape_idx: int) -> void:
	if event.is_action_pressed("left_click"):
		print("Clicked card: " + attributes.name)

func set_data(resource: CardData):
	attributes = resource
	var image = Image.load_from_file(attributes.sprite_path)
	$Sprite.texture = ImageTexture.create_from_image(image)

func is_empty():
	return attributes == null

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
