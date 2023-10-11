object asentamiento {
	method apply(unaPersona) {
		unaPersona.asentarRecuerdosDelDia()
	} 
}

class AsentamientoSelectivo {
	const clave
	
	method apply(unaPersona) {
		unaPersona.asentarRecuerdosDelDiaSelectivo(clave)
	} 
}

object profundizacion {
	method apply(unaPersona) {
		unaPersona.profundizar()
	}
}

object controlHormonal {
	method apply(unaPersona) {
		if (unaPersona.puedeDesequilibrarse()) {
			unaPersona.desequilibrarse()
		}
	}
}

object restauracionCognitiva {
	method apply(unaPersona) {
		unaPersona.restaurarFelicidad(100)
	}
}
