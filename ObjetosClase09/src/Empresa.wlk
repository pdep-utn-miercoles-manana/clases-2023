import Tablero.*
import Propiedad.*
 
class Empresa inherits Propiedad {
	override method sosEmpresa() = true
	
	method rentaPara(unJugador) = unJugador.tirarDados() * 30000 * duenio.cantidadEmpresas()
	
	method esParaGarca(unJugador) = tablero.hayDuenioDeEmpresaDistintoA(unJugador)
	
	method esParaImperialista(unJugador) = tablero.todasTusEmpresasSonDelBanco(unJugador)
	
}