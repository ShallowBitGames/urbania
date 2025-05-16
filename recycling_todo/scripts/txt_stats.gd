extends RichTextLabel


func showInfo(position : Vector2i, population : int, happiness : int, appeal : int):
	self.text = "Position: " +  str(position) + "\n"
	self.text += "Population: " + str(population) + "\n"
	self.text += "Happiness: " + str(happiness) + "\n"
	self.text += "Appeal: " + str(appeal) + "\n"
