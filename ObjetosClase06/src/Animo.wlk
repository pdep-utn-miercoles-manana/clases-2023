class Contento {
	var cantidadDeVecesQueHaJugado = 0
	
	method esContento() = true
	
	method comer(unTamagotchi) {
		unTamagotchi.aumentarFelicidad(1)
	}

	method jugar(unTamagotchi) {
		self.cambiaAHambriento(unTamagotchi)
		unTamagotchi.aumentarFelicidad(2)
		cantidadDeVecesQueHaJugado++
	}

	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.jugar()
		otroTamagotchi.jugar()
		otroTamagotchi.aumentarFelicidad(4)
	}

	method cambiaAHambriento(unTamagotchi) {
		if (cantidadDeVecesQueHaJugado > 2) {
			unTamagotchi.poneteHambriento()
		}
	}
}

class Triste {
	const tiempo = new Date()
	
	method esContento() = false
	
	method comer(unTamagotchi) {
		if (self.pasoMuchoTiempo()) {
			unTamagotchi.poneteContento()
		}
	}
	
	method jugar(unTamagotchi) {
		unTamagotchi.poneteContento()
	}

	method jugarCon(unTamagotchi, otroTamagotchi) {
		unTamagotchi.poneteContento()
		otroTamagotchi.poneteContento()
	}
	
	method pasoMuchoTiempo() {
		return tiempo.plusDays(2) < new Date()
		// Esto es para 2 días y no dos minutos... 
		// Wollok no maneja la idea de tiempo, solo de fechas, entonces en lugar de dos minutos
		// decidí unilateralmente que sean 2 días en lugar de 2 minutos
	}
}

object hambriento {
	method esContento() = false
	
	method comer(unTamagotchi) {
		unTamagotchi.poneteContento()
	}

	method jugar(unTamagotchi) {
		unTamagotchi.disminuirFelicidad(4)
	}

	method jugarCon(unTamagotchi, otroTamagotchi) {
		// No hace nada, dejo el método vacío para no romper la interfaz de los distintos ánimos
	}
}

object cansado {
	method esContento() = false
	
	method comer(unTamagotchi) {
		unTamagotchi.disminuirFelicidad(5)
	}
	
	method jugar(unTamagotchi) {
		self.error("No QUIERO JUGARRRR, toy Cansaooo'")
	}

	method jugarCon(unTamagotchi, otroTamagotchi) {
		self.jugar(unTamagotchi)
	}
}
