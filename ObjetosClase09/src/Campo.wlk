import Banco.*
import Propiedad.*

class Campo inherits Propiedad {
	var cantidadEstancias

	const provincia
	const valorRentaFijo
	const costoConstruccionEstancia
	
	method cantidadEstancias() = cantidadEstancias
	
	method agregarEstancia() {
		self.validarConstruccionEstancia()
		duenio.pagarA(banco, costoConstruccionEstancia)
	}
	
	method validarConstruccionEstancia() {
		provincia.validarMonopolio(duenio)
		provincia.validarConstruccionPareja(self)
	}
	
	method rentaPara(unJugador) = 2 ** 3 * valorRentaFijo
	
	method esParaGarca(unJugador) = provincia.hayDuenioDistintoA(unJugador)
	
	method esParaImperialista(unJugador) = provincia.esDuenio(unJugador)
	
	override method valorHipoteca() = super() + (costoConstruccionEstancia * self.cantidadEstancias()) / 2
}
