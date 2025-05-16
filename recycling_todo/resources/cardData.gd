extends Resource
class_name CardData

@export var name : String = "EMPTY"
@export var radius : int = 0
@export var qol : float = 0
@export var attr : float = 0
@export var sprite_path : String = "res://test-pngs/test-card.png"
@export var modifiers : Dictionary = {
	"MIXED": 1.0,
	"LI": 1.0,
	"SFH": 1.0,
	"WEALTH": 1.0,
	"TREND": 1.0,
	"STUDENT": 1.0
}
