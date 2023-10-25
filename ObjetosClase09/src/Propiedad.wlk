import Banco.*
import Casillero.*

class Propiedad inherits Casillero {
	var estaHipotecada = false
	var property duenio
	const precioCompra
	
	method precioCompra() = precioCompra * if (estaHipotecada) 1 else 1.5
	
	override method cayo(unJugador) {
		duenio.cayoEn(unJugador, self)
	}
	
	method teCompro(unJugador) {
		unJugador.agregarPropiedad(self)
		duenio = unJugador
		estaHipotecada = false
	}
	
	method esDe(unDuenio) = duenio == unDuenio
	
	method hipotecarPara(unJugador) {
		banco.pagarA(unJugador, self.valorHipoteca())
		unJugador.quitarPropiedad(self)
		duenio = banco
		estaHipotecada = true
	}
	
	method valorHipoteca() = precioCompra / 2
}
