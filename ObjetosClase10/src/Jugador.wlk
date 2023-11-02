import Escoba.*
import MercadoDeEscobas.*

class Jugador {

	var peso
	var equipo
	var escoba
	var skills
	var fuerza
	var vision
	var punteria
	var reflejos

	method nivelManejoEscoba() = skills / peso

	method velocidad() = self.nivelManejoEscoba() * escoba.velocidad()

	method habilidad() = self.velocidad() + skills + self.habilidadPosicion()

	method habilidadPosicion()

	method lePasaElTrapo(unJugador) = unJugador.habilidad() * 2 < self.habilidad()

	method esGroso() = self.esMuyHabilidoso() and self.esMuyVeloz()

	method esMuyHabilidoso() = self.habilidad() > equipo.habilidadPromedio()

	method esMuyVeloz() = self.velocidad() > mercadoDeEscobas.valor()

	method esEstrellaContra(unEquipo) = unEquipo.lePasaElTrapo(self)

	method aumentarSkills(unaCantidad) {
		skills += unaCantidad
	}

	method disminuirSkills(unaCantidad) {
		skills = 0.max(skills - unaCantidad)
	}

	method esCazador() = false

	method bloquearA(unJugador) {
		unJugador.disminuirSkills(2)
		self.aumentarSkills(10)
	}

	method esGolpeadoPorUnaBludgerDe(_unEquipo) {
		self.disminuirSkills(2)
		escoba.recibirGolpe()
	}

}

class Cazador inherits Jugador {

	var tieneLaQuaffle = false

	method tieneLaQuaffle() = tieneLaQuaffle

	override method habilidadPosicion() = punteria * fuerza

	override method esCazador() = true

	method jugarContra(unEquipo) {
		if (tieneLaQuaffle) {
			self.intentarMeterGol(unEquipo)
		}
	}

	method intentarMeterGol(unEquipo) {
		unEquipo.bloquearA(self)
		self.perderQuaffleContra(unEquipo)
	}

	method meterGol() {
		equipo.ganarPuntos(10)
		self.aumentarSkills(5)
	}

	method perderQuaffleContra(unEquipo) {
		tieneLaQuaffle = false
		unEquipo.agarrarQuaffle()
	}

	method agarraQuaffle() {
		tieneLaQuaffle = true
	}

	method puedeBloquearA(unCazador) = self.lePasaElTrapo(unCazador)

	method esBlancoUtil() = tieneLaQuaffle

	override method esGolpeadoPorUnaBludgerDe(unEquipo) {
		super(unEquipo)
		self.perderQuaffleContra(unEquipo)
	}

}

class Guardian inherits Jugador {

	override method habilidadPosicion() = reflejos + fuerza

	method jugarContra(_unEquipo) {
	// No hace nada
	}

	method puedeBloquearA(unCazador) = (1 .. 3).anyOne() == 3

	method esBlancoUtil() = not equipo.tieneLaQuaffle()

}

class Golpeador inherits Jugador {

	override method habilidadPosicion() = punteria + fuerza

	method jugarContra(unEquipo) {
		const blanco = unEquipo.blancoUtil()
		if (self.puedeGolpear(blanco)) {
			blanco.esGolpeadoPorUnaBludgerDe(equipo)
		}
	}

	method puedeGolpear(unJugador) = punteria > unJugador.reflejos() or (1 .. 10).anyOne() >= 8

	method puedeBloquearA(_unCazador) = self.esGroso()

	method esBlancoUtil() = false

}

class Buscador inherits Jugador {

	var estadoDeJuego = new BuscandoSnitch()

	override method habilidadPosicion() = reflejos * vision

	method jugarContra(_unEquipo) {
		estadoDeJuego.hacerQueJuegue(self)
	}

	method perseguirSnitch() {
		estadoDeJuego = new PersiguiendoSnitch()
	}

	method buscarSnitch() {
		estadoDeJuego = new BuscandoSnitch()
	}

	method agarrarSnitch() {
		self.aumentarSkills(10)
		equipo.ganarPuntos(150)
	}

	method puedeBloquearA(_unCazador) = false

	method esBlancoUtil() = estadoDeJuego.esBlancoUtil()

	override method esGolpeadoPorUnaBludgerDe(unEquipo) {
		if (self.esGroso()) {
			self.aturdirse()
		} else {
			self.buscarSnitch()
		}
	}

	method aturdirse() {
		estadoDeJuego = new Aturdido(estadoActual = estadoDeJuego)
	}

	method volverAlEstado(unEstadoAnterior) {
		estadoDeJuego = unEstadoAnterior
	}

}

class BuscandoSnitch {

	var turnos = 0

	method hacerQueJuegue(unJugador) {
		turnos++
		if (self.pudoEncontrarLaSnitch(unJugador)) {
			unJugador.perseguirSnitch()
		}
	}

	method pudoEncontrarLaSnitch(unJugador) = (1 .. 1000).anyOne() < unJugador.habilidad() + turnos

	method esBlancoUtil() = true

}

class PersiguiendoSnitch {

	var kilometrosRecorridos = 0

	method hacerQueJuegue(unJugador) {
		self.recorrerKilometros(unJugador)
		if (kilometrosRecorridos >= 5000) {
			unJugador.agarrarSnitch()
		}
	}

	method recorrerKilometros(unJugador) {
		kilometrosRecorridos += unJugador.velocidad() / 1.6
	}

	method esBlancoUtil() = kilometrosRecorridos > 4000

}

class Aturdido {

	const estadoActual
	var pasoUnTurnoAturdido = false

	method hacerQueJuegue(unJugador) {
		if (pasoUnTurnoAturdido) unJugador.volverAlEstado(estadoActual)
		pasoUnTurnoAturdido = true
	}

	method esBlancoUtil() = estadoActual.esBlancoUtil()

}

