import wollok.game.*

class Barril {
	var property position = new Position(
		x = 0.randomUpTo(game.width()),
		y = 0.randomUpTo(game.height()) 
	)
	
	method image() = "barril.png"
	
	method hablar() {
		game.say(self, "Tomame")
	}
}
