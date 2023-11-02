class Equipo {

	const jugadores = []
	var puntos = 0

	method tieneJugadorEstrellaContra(unEquipo) {
		return jugadores.any { jugador => jugador.esEstrellaContra(unEquipo) }
	}
	
	method lePasaElTrapo(unJugador) {
		return jugadores.all { jugador => unJugador.lePasaEltrapo(jugador) }
	}
	
	method jugarContra(unEquipo) {
		jugadores.forEach { jugador => jugador.jugarContra(unEquipo) }
	}
	
	method ganarPuntos(unosPuntos) {
		puntos += unosPuntos
	}
	
	method puedeBloquearA(unJugador) = false

	method bloquearA(unJugador) {
		const bloqueador = jugadores.findOrDefault({ jugador => jugador.puedeBloquearA(unJugador) }, noBloqueo)
		bloqueador.bloquearA(unJugador)	
	} 
	
	method agarrarQuaffle() {
		self.cazadorMasRapido().agarrarQuaffle()
	}
	
	method cazadorMasRapido() = self.cazadores().max { cazador => cazador.velocidad() }
	
	method cazadores() = jugadores.filter { jugador => jugador.esCazador() }

	method blancoUtil() = jugadores.findOrDefault({ jugador => jugador.esBlancoUtil() }, noBlancoUtil)

	method tieneLaQuaffle() = self.cazadores().any { cazador => cazador.tieneLaQuaffle() }

}

object noBloqueo {
	method bloquearA(unJugador)	{
		unJugador.meterGol()
	}
}

object noBlancoUtil {
	method esGolpeadoPorUnaBludger() {
		// No hace nada
	}
}