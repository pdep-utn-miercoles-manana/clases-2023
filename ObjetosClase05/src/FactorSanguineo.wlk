object factorA {
	method puedeDonarA(unFactorSanguineo) {
		return unFactorSanguineo === self or unFactorSanguineo === factorR
	}
}

object factorR {
	method puedeDonarA(unFactorSanguineo) {
		return unFactorSanguineo === self
	}
}

object factorO {
	method puedeDonarA(unFactorSanguineo) {
		return true
	}
}


/*
 * La notación siguiente es un Syntax Sugar de wollok para 
 * métodos de una línea que retornan un valor se escribe como:
 * 
 * method nombreDelMetodo(...) = expresionADevolver
 */

object factorRHNegativo {
	method puedeDonarA(unFactorRH) = true
}
object factorRHPositivo {
	method puedeDonarA(unFactorRH) = unFactorRH == self
}


object tipoO {
	method puedeDonarA(unTipoSanguineo) = true
}
object tipoA {
	method puedeDonarA(unTipoSanguineo) = [self, tipoAB].contains(unTipoSanguineo)
}
object tipoB {
	method puedeDonarA(unTipoSanguineo) = [self, tipoAB].contains(unTipoSanguineo)
}
object tipoAB {
	method puedeDonarA(unTipoSanguineo) = unTipoSanguineo == self
}


class GrupoSanguineo {
	const property tipo
	const property factor
	
	method puedeDonarA(unGrupoSanguineo) {
		return factor.puedeDonarA(unGrupoSanguineo.factor()) and tipo.puedeDonarA(unGrupoSanguineo.tipo())
	}
}


const grupoONegativo = new GrupoSanguineo(tipo = tipoO, factor = factorRHNegativo) 
const grupoOPositivo = new GrupoSanguineo(tipo = tipoO, factor = factorRHPositivo) 

const grupoANegativo = new GrupoSanguineo(tipo = tipoA, factor = factorRHNegativo) 
const grupoAPositivo = new GrupoSanguineo(tipo = tipoA, factor = factorRHPositivo) 

const grupoBNegativo = new GrupoSanguineo(tipo = tipoB, factor = factorRHNegativo) 
const grupoBPositivo = new GrupoSanguineo(tipo = tipoB, factor = factorRHPositivo) 

const grupoABNegativo = new GrupoSanguineo(tipo = tipoAB, factor = factorRHNegativo) 
const grupoABPositivo = new GrupoSanguineo(tipo = tipoAB, factor = factorRHPositivo) 
