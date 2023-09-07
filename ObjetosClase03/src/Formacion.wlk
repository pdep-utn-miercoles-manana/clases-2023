class Formacion {
	const property vagones = []
	const property locomotoras = []

	// Punto 1
	method agregarVagon(unVagon) {
		vagones.add(unVagon)
	}	

	// Punto 2
	method agregarLocomotora(unaLocomotora) {
		locomotoras.add(unaLocomotora)
	}
	
	// Punto 3
	method cantidadVagones() {
		return vagones.size()
	}
	
	// Punto 4
	method totalPasajeros() {
		return vagones.sum { vagon => vagon.cantidadPasajeros() }
	}
	
	// Punto 5
	method cantidadVagonesLivianos() {
		return vagones.count { vagon => vagon.esLiviano() }
	}
	
	// Punto 6
	method velocidadMaxima() {
		return locomotoras.map { locomotora => locomotora.velocidadMaxima() }.min()
	}
	
	// Punto 7
	method esEficiente() {
		return locomotoras.all { locomotora => locomotora.esEficiente() }
	}
	
	// Punto 8
	method puedeMoverse() {
		return self.arrastreUtilTotal() >= self.pesoMaximoVagones()
	}
	
	method arrastreUtilTotal() {
		return locomotoras.sum { locomotora => locomotora.arrastreUtil() }
	}

	method pesoMaximoVagones() {
		return vagones.sum { vagon => vagon.pesoMaximo() }
	}

	// Punto 9
	method kilosDeEmpujeFaltante() {
		return 0.max(self.arrastreUtilTotal() - self.pesoMaximoVagones())
	}

	// Punto 10
	method vagonMasPesado() {
		return vagones.max { vagon => vagon.pesoMaximo() }
	}
	
	// Punto 11
	method esCompleja() {
		return self.tieneMuchasUnidades() || self.pesoTotal() > 10000
	}
	
	method tieneMuchasUnidades() {
		return self.cantidadUnidades() > 20
	}

	method cantidadUnidades() {
		return self.cantidadVagones() + self.cantidadLocomotoras()
	}
	
	method cantidadLocomotoras() {
		return locomotoras.size()
	}
	
	method pesoTotal() {
		return self.pesoMaximoVagones() + self.pesoMaximoLocomotoras() 
	}
	
	method pesoMaximoLocomotoras() {
		return locomotoras.sum { locomotora => locomotora.peso() }
	}
}
