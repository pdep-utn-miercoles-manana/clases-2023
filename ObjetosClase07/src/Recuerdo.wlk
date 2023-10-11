class Recuerdo {
	const property fecha = new Date()
	const property descripcion
	const property emocion
	const property persona
	
	// -- Punto 02 --
		
	method asentarse() {
		emocion.asentarPara(persona, self)
	}
	
	// ------------------------------------------
	
	method esDificilDeExplicar() = self.cantidadDePalabras() > 10
	
	method cantidadDePalabras() = self.palabras().size()
	
	method palabras() = descripcion.words()
	
	// ------------------------------------------
	
	method tiene(unaPalabra) = self.palabras().contains(unaPalabra)
	
	// ------------------------------------------
	
	method es(unaEmocion) {
		return unaEmocion == emocion
	}
	
	// ------------------------------------------
	
	method esAntiguo() = persona.edad() / 2 < self.aniosTranscurridos()
	
	method aniosTranscurridos() = new Date().year() - fecha.year()
	
}
