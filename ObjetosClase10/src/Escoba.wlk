class Nimbus {

	const anioFabricacion
	var porcentajeSalud

	method velocidad() = (80 - self.antiguedad()) * porcentajeSalud / 100

	method antiguedad() = self.anioActual() - anioFabricacion

	method anioActual() = new Date().year()
	
	method recibirGolpe() {
		porcentajeSalud -= 10
	}

}

class SaetaDeFuego {

	method velocidad() = 100
	
	method recibirGolpe() {
		// No le pasa nada
	}

}

