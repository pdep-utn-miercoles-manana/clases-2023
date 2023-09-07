class VagonPasajeros {
	const anchoUtil
	const largo
	
	method cantidadPasajeros() {
		return if (anchoUtil <= 2.5) {
			largo * 8
		} else {
			largo * 10
		}
	}
	
	method esLiviano() {
		return self.pesoMaximo() < 2500
	}
	
	method pesoMaximo() {
		return self.cantidadPasajeros() * 80
	}

}