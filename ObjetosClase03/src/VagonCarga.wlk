class VagonCarga {
	var cargaMaxima
	
	method cantidadPasajeros() {
		return 0
	}
	
	method esLiviano() {
		return self.pesoMaximo() < 2500
	}
	
	method pesoMaximo() {
		return cargaMaxima + 160
	}
}
