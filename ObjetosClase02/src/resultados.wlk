
object resultadoNulo {
	method bonoPara(_unaPersona) {
		return 0
	}
}
object resultadoFijo {
	method bonoPara(_unaPersona) {
		return 80
	}
}
object resultadoPorcentual {
	method bonoPara(unaPersona) {
		return unaPersona.sueldoNeto()  * 0.1
	}
}
