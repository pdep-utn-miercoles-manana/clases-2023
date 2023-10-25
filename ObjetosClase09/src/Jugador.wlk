import Banco.*
import TiroDeDados.*
import EstadoDeLibertad.*
import GameOverException.*

class Jugador {
	var dinero
	var casilleroActual
	var estadoDeLibertad = self.libre()
	var estrategiaDeCompra
	 
	const propiedades = []
	
	method casilleroActual() = casilleroActual

	method pagarA(unAcreedor, unMonto) {
		self.validarPuedePagar(unMonto)
		self.pagar(unMonto)
		unAcreedor.cobrar(unMonto)
	}
	
	method validarPuedePagar(unMonto) {
		if (not self.puedePagar(unMonto)) {
			self.hipotecarParaPagar(unMonto)
		}
	}
	
	method hipotecarParaPagar(unMonto) {
		self.hipotecarPropiedad()
		self.validarPuedePagar(unMonto)
	}
	
	method hipotecarPropiedad() {
		if (propiedades.isEmpty()) {
			throw new GameOverException()
		}
		propiedades.anyOne().hipotecarPara(self)
	}
	
	method puedePagar(unMonto) = dinero <= unMonto
	
	method pagar(unMonto) {
		dinero -= unMonto
	}
	
	method cobrar(unMonto) {
		dinero += unMonto
	}
	
	method cantidadEmpresas() {
		return propiedades.count { propiedad => propiedad.sosEmpresa() }
	}
	
	method tirarDados() {
		const tiro = new TiroDeDados()
		estadoDeLibertad.evaluarTiro(tiro)
		return tiro.valor()
	}
	
	method cayoEn(unJugador, unaPropiedad) {
		unJugador.pagarA(self, unaPropiedad.rentaPara(unJugador))
	}
	
	method comprar(unaPropiedad) {
		estrategiaDeCompra.evaluarCompraDe(self, unaPropiedad)
	}

	method realizarCompra(unaPropiedad) {
		self.pagarA(banco, unaPropiedad.precioCompra())
		unaPropiedad.teCompro(self)
	}
	
	method agregarPropiedad(unaPropiedad) {
		propiedades.add(unaPropiedad)
	}
	
	method quitarPropiedad(unaPropiedad) {
		propiedades.remove(unaPropiedad)
	}
	
	method moveteSobre(unosCasilleros) {
		estadoDeLibertad.moverSobre(self, unosCasilleros)
	}
	
	method pasarPor(unosCasilleros) {
		unosCasilleros.forEach { casillero => casillero.paso(self) }
	}

	method caerEn(unCasillero) {
		unCasillero.cayo(self)
		casilleroActual = unCasillero
	}
	
	method irACasa() {
		estadoDeLibertad = self.libre()
	} 
	
	method irACarcel() {
		estadoDeLibertad = new Preso(jugador = self)
	} 
	
	method libre() = new Libre(jugador = self)
	
}
