class Deposito {
	const property formaciones = []
	const property locomotoras = []

	// Punto 10
	method vagonesMasPesados() {
		return formaciones.map { formacion => formacion.vagonMasPesado() }
	}
	
	// Punto 11
	method necesitaConductorExperimentado() {
		return formaciones.any { formacion => formacion.esCompleja() } 
	}
	
	// Punto 12
	method agregarLocomotoraA(unaFormacion) {
		const locomotora = locomotoras.find { locomotora => locomotora.puedeArrastrar(unaFormacion) }
		locomotoras.remove(locomotora)
		unaFormacion.agregarLocomotora(locomotora)
	}
}
