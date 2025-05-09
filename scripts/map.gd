extends Node2D

var MapScript = load("res://Logic/Map.cs")
var Map = MapScript.new()

const GTNormal = "NORMAL";
const GTForest = "FOREST";
const GTWater = "WATER";

func _init() -> void:
	Map.Generate()
	var grounds = Map.GetGroundMap()
	for row in grounds:
		for gt in row:
			$TML_Base
		
	
