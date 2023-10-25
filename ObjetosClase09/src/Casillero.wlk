import Banco.*

class Casillero {
	method paso(unJugador) {
		// No hace nada
	}
	
	method cayo(unJugador) {
		// No hace nada
	}
	
	method sosEmpresa() = false	
}

object salida inherits Casillero {
	override method paso(unJugador) {
		banco.pagarA(unJugador, 5000)
	}
}

object premioGanadero inherits Casillero {
	override method cayo(unJugador) {
		banco.pagarA(unJugador, 2500)
	}
}

const prision = new Casillero()