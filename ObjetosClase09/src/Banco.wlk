object banco {
	method pagarA(unAcreedor, unMonto) {
		unAcreedor.pagar(unMonto)
	}
	
	method pagar(unMonto) {
		// No tiene sentido que maneje un atributo dinero. 
		// Solo se hace para mantener el polimorfismo
	}

	method cobrar(unMonto) {
		// No tiene sentido que maneje un atributo dinero. 
		// Solo se hace para mantener el polimorfismo
	}
	
	method cayoEn(unJugador, unaPropiedad) {
		unJugador.comprar(unaPropiedad)
	}
}