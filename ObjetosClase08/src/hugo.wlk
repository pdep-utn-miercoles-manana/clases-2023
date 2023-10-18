import wollok.game.*

object hugo {
	var property position = game.center()
	var ebriedad = 0
	
	method image() = "hugo.png"
	
	method embriagarse() {
		ebriedad = ebriedad + 0.1
		game.say(self, "Tengo " + ebriedad.toString() + " en sangre")
	}
	
	method puedeManejar() {
		if(ebriedad <= 0.5) {
			game.say(self, "Estoy apto")
		} else {
			self.error("No puedo manejar")
		}
	}
	
	method hablar() {
		game.say(self, "Yendo")
	}
	
}
