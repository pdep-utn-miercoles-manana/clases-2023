class Provincia {
	const campos = []
	
	method duenios() {
		return campos.map { campo => campo.duenio() }.asSet()
	}
	
	method validarMonopolio(unJugador) {
		if (not self.esMonopolio(unJugador)) {
			throw new DomainException(message = "No es monopolio del jugador")
		}
	}
		
	method validarConstruccionPareja(unCampo) {
		if (not self.esConstruccionPareja(unCampo)) {
			throw new DomainException(message = "No es construccion pareja")
		}
	}
	
	method esMonopolio(unJugador) {
		return self.duenios() == #{unJugador}
	}
	
	method esConstruccionPareja(unCampo) {
		return campos.all { campo => campo.cantidadEstancias() >= unCampo.cantidadEstancias() }
	}
	
	method hayDuenioDistintoA(unJugador) {
		return not self.esDuenio(unJugador)
	}
	
	method esDuenio(unJugador) {
		return self.duenios().contains(unJugador)
	}
}
