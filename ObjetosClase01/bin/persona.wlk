import mascotas.laika

object joaco {
	var energia = 100
	var mascota = laika
	
	method irAPasear() {
		mascota.irAPasear()
		energia -= 10
	}
	
}
