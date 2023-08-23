object laika {
	var energia = 100
	var raza = "Perro"
	
	method ==(otroPerro) {
		// si coinciden en
		// energia y raza
	}
	
	method ladrido() {
		return "Guau!"
	}
	
	method comer(unaCantidad) {
		energia += unaCantidad
	}
	
	method irAPasear() {
		// energia = energia - 20
		energia -= 20
	}
	
	method raza() {
		return raza
	}
		
	method energia() { // Getter
		return energia
	}
	
	method energia(unaEnergia) { // Setter
		energia = unaEnergia
	}
	
	method hacerRutina() {
		self.comer(20)
		self.irAPasear()
	}
}

const mascota = laika

object dolly {
	var energia = 100
	var raza = "Perro"
	
	method ladrido() {
		return "Guau!"
	}
	
	method comer(unaCantidad) {
		energia += unaCantidad
	}
	
	method irAPasear() {
		// energia = energia - 20
		energia -= 20
	}
	
	method raza() {
		return raza
	}
	
	method energia() { // Getter
		return energia
	}
	
	method energia(unaEnergia) { // Setter
		energia = unaEnergia
	}
	
	method hacerRutina() {
		self.comer(20)
		self.irAPasear()
	}
}

// WKO -> well known objects
// unObjeto.unMensaje()