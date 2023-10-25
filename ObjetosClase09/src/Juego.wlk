import Tablero.*
import GameOverException.*

class Juego {
  	const property jugadores = []
  	var property estaTerminado = false
  
  	method jugarUnTurno() {
    	if (not self.estaTerminado()) {
      		jugadores.forEach { jugador => self.queJuegue(jugador) }
      		self.jugarUnTurno()
    	}
  	}
  
  	method queJuegue(unJugador) {
  		const numero = unJugador.tirarDados()
  		const casilleros = tablero.casillerosDesdeHasta(unJugador.casilleroActual(), numero)
  		try {
  			unJugador.moveteSobre(casilleros)
		} catch e : GameOverException {
			jugadores.remove(unJugador)
		} catch e : DomainException {
			// Esconderlo bajo la alfombra
		}
  	}
}
