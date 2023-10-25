class EstrategiaDeCompra {
	method evaluarCompraDe(unJugador, unaPropiedad) {
		if (self.puedeComprar(unJugador, unaPropiedad)) {
			unJugador.realizarCompra(unaPropiedad)
		}
	}
	
	method puedeComprar(unJugador, unaPropiedad)
}

object standard inherits EstrategiaDeCompra {
	override method puedeComprar(unJugador, unaPropiedad) {
		return true		
	}
}

object garca inherits EstrategiaDeCompra {
	override method puedeComprar(unJugador, unaPropiedad) {
		return unaPropiedad.esParaGarca(unJugador)
	}
}

object imperialista inherits EstrategiaDeCompra {
	override method puedeComprar(unJugador, unaPropiedad) {
		return unaPropiedad.esParaImperialista(unJugador)
	}
}