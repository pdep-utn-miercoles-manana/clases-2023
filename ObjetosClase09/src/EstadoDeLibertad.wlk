import Banco.*

class Libre {
	const jugador
	var cantidadDeTirosDoblesSeguidos = 0
	
	method evaluarTiroPara(unTiroDeDados) {
		if (unTiroDeDados.fueDoble()) {
			cantidadDeTirosDoblesSeguidos++
		} else {
			cantidadDeTirosDoblesSeguidos = 0
		}
		
		if (cantidadDeTirosDoblesSeguidos == 2) jugador.irACarcel()
	}
	
	method moverSobre(unJugador, unosCasilleros) {
		unJugador.pasarPor(unosCasilleros)
		unJugador.caerEn(unosCasilleros.last())					
	}
}

class Preso {
	const jugador
	var cantidadTurnosPreso = 0
	
	method evaluarTiroPara(unTiroDeDados) {
		cantidadTurnosPreso++
		
		if (unTiroDeDados.fueDoble() or cantidadTurnosPreso == 3) {
			jugador.irACasa()
		}
	}

	method moverSobre(unJugador, unosCasilleros) {
		// Esta preso, no se puede mover
	}
}