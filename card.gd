extends Area2D
class_name Card

const ATTRIBUTES = preload("res://resources/cardData.gd")

var attributes

func set_sprite(path: String) -> void:
	var image = Image.load_from_file(path)
	$Sprite.texture = ImageTexture.create_from_image(image)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
