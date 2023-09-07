class Locomotora {
	const property velocidadMaxima 
	const property arrastreMaximo 
	const property peso
	
	method esEficiente() {
		return arrastreMaximo >= 5 * peso
	}
	
	method arrastreUtil() {
		return arrastreMaximo - peso
	}
	
	method puedeArrastrar(unaFormacion) {
		return self.arrastreUtil() >= unaFormacion.kilosDeEmpujeFaltante()
	}
}