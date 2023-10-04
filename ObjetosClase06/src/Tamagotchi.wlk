import Animo.*

class Tamagotchi {
	var property animo = new Contento()
	var felicidad = 0
	
	method comer() {
		animo.comer(self)
	}
	
	method jugar() {
		animo.jugar(self)
	}
	
	method jugarCon(otroTamagotchi) {
		animo.jugarCon(self, otroTamagotchi)
	}
	
	method dormir() {
		self.poneteContento()
	}

	method estoyContento() {
		return animo.esContento()
	}
	
	method poneteContento() {
		if (not self.estoyContento()) {
			self.animo(new Contento())
		}
	}
	
	method poneteTriste() {
		self.animo(new Triste())
	}
	
	method poneteHambriento() {
		self.animo(hambriento)
	}
	
	method poneteCansado() {
		self.animo(cansado)
	}
	
	method aumentarFelicidad(unaCantidad) {
		felicidad += unaCantidad
	}
	
	method disminuirFelicidad(unaCantidad) {
		felicidad = 0.max(felicidad - unaCantidad)
	}
}

class Gloton inherits Tamagotchi {
	override method comer() {
		self.aumentarFelicidad(5)
		super()
	}
}

class Antisocial inherits Tamagotchi {
	override method jugarCon(otroTamagotchi) {
		self.poneteTriste()
	}
}

class Dormilon inherits Tamagotchi {
	override method jugar() {
		super()
		if (felicidad < 10) {
			self.poneteCansado()
		}
	}
}
