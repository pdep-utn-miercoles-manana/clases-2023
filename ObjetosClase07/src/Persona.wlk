import Emocion.*
import Recuerdo.*

class Persona {
	const recuerdosDelDia = []
	const pensamientosCentrales = #{}
	const procesosMentales = []
	const recuerdosALargoPlazo = []
	
	var property edad
	var emocionDominante
	var felicidad
	var pensamientoActual = null 

	// -- Punto 01 --
	
	method vivirEvento(unaDescripcion) {
		recuerdosDelDia.add(self.nuevoRecuerdo(unaDescripcion))
	}
	
	method nuevoRecuerdo(unaDescripcion) {
		return new Recuerdo(descripcion = unaDescripcion, emocion = emocionDominante, persona = self)
	}
	
	// ------------------------------------------
	
	method centralizar(unRecuerdo) {
		pensamientosCentrales.add(unRecuerdo)
	}
	
	method entristecerse(unPorcentaje) {
		felicidad *= 1 - unPorcentaje / 100
		self.validarFelicidad()
	}
	
	method validarFelicidad() {
		if (felicidad < 1) self.error('La felicidad no puede ser menor a uno')
	}
	
	// -- Punto 03 --
	
	method recuerdosRecientesDelDia() {
		return recuerdosDelDia.reverse().take(5)
	}
	
	// -- Punto 04 --
	
	method pensamientosCentrales() = pensamientosCentrales
	
	// -- Punto 05 --
	
	method pensamientosCentralesDificilesDeExplicar() {
		return pensamientosCentrales.filter { pensamiento => pensamiento.esDificilDeExplicar() }
	}
	
	// -- Punto 06 --
	
	method niega(unRecuerdo) {
		return emocionDominante.niega(unRecuerdo.emocion())
	}
	
	// -- Punto 07 --
	
	method dormir() {
		self.desencadenarProcesosMentales()
		self.liberarRecuerdosDelDia()
	}
	
	method desencadenarProcesosMentales() {
		procesosMentales.forEach { procesoMental => procesoMental.apply(self) }
	}
	
	method liberarRecuerdosDelDia() {
		recuerdosDelDia.clear()
	}

	// -- Punto 08 --
	
	method rememorar() {
		pensamientoActual = recuerdosALargoPlazo.find { recuerdo => recuerdo.esAntiguo() }
	}
	
	// -- Punto 09 --
	
	method cantidadRepeticionesDe(unRecuerdo) = recuerdosALargoPlazo.occurrencesOf(unRecuerdo)
	
	// -- Punto 10 --
	
	method tieneUnDejaVu() = self.cantidadRepeticionesDe(pensamientoActual) > 1
	
	// ------------------------------------------
	
	method asentarRecuerdosDelDia() {
		self.asentarRecuerdos(recuerdosDelDia)
	}
	
	method asentarRecuerdosDelDiaSelectivo(unaClave) {
		const recuerdos = recuerdosDelDia.filter { recuerdo => recuerdo.tiene(unaClave) }
		self.asentarRecuerdos(recuerdos)
	}
	
	method asentarRecuerdos(unosRecuerdos) {
		unosRecuerdos.forEach { recuerdo => recuerdo.asentarse() }
	}
	
	method profundizar() {
		const recuerdosCentralesNoNegados = pensamientosCentrales.filter { recuerdo => not self.niega(recuerdo) }
		recuerdosALargoPlazo.addAll(recuerdosCentralesNoNegados)
	}
	
	method puedeDesequilibrarse() {
		return self.tienePensamientoCentralEnMemoriaALargoPlazo() or self.mismaEmocionEnElDia()
	}
	
	method tienePensamientoCentralEnMemoriaALargoPlazo() {
		return not pensamientosCentrales.intersection(recuerdosALargoPlazo).isEmpty()
	}
	
	method mismaEmocionEnElDia() {
		return recuerdosDelDia.all { recuerdo => recuerdo.es(emocionDominante) }
	}
	
	method desequilibrarse() {
		self.entristecerse(15)
		self.perderTresPensamientosCentralesMasAntiguos()
	}
	
	method perderTresPensamientosCentralesMasAntiguos() {
		pensamientosCentrales.removeAll(self.tresPensamientosCentralesMasAntiguos())
	}
	
	method tresPensamientosCentralesMasAntiguos() {
		return self.pensamientosCentralesPorAntiguedad().take(3)
	}
	
	method pensamientosCentralesPorAntiguedad() {
		return pensamientosCentrales.sortedBy { antiguo, reciente => antiguo.fecha() < reciente.fecha() }
	}
	
	method restaurarFelicidad(unaCantidad) {
		felicidad = 1000.min(felicidad + unaCantidad)
	}
	
	// -- Getter --
	
	method felicidad() = felicidad
}

const riley = new Persona(emocionDominante = alegria, felicidad = 1000, edad = 11)
