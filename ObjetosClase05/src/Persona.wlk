import Excepciones.* 

class Persona {
    const property enfermedades = #{}
	const property factorSanguineo
    
    var temperatura = 36
    var cantidadCelulas = 3000000
	
    method contraer(unaEnfermedad) {
        enfermedades.add(unaEnfermedad)
    }

    method tiene(unaEnfermedad) {
        return enfermedades.contains(unaEnfermedad)
    }

    method vivirUnDia() {
    	enfermedades.forEach { enfermedad => enfermedad.afectarA(self) }
    }

    method aumentarTemperatura(unosGrados) {
    	temperatura = 45.min(temperatura + unosGrados)
    }

    method destruirCantidadCelulas(unaCantidadCelulas) {
        cantidadCelulas = 0.max(self.cantidadCelulas() - unaCantidadCelulas)
    }

    method enfermedadMasAmenazante() {
    	return enfermedades.max { enfermedad => enfermedad.cantidadCelulasAmenazadas() }
    }

    method estaEnComa() {
        return temperatura == 45 or self.cantidadCelulas() < 1000000
    }

    method cantidadCelulasAmenazadasPorEnfermedadesAgresivas() {
        return self.enfermedadesAgresivas().sum { enfermedad => enfermedad.cantidadCelulasAmenazadas() }
    }

    method enfermedadesAgresivas() {
        return enfermedades.filter { enfermedad => enfermedad.esAgresivaPara(self) }
    }

    method vivirDias(unosDias) {
        unosDias.times { dia => self.vivirUnDia() }
    }

    method cantidadCelulas() {
        return cantidadCelulas
    }

    method medicateCon(unaDosis) {
        enfermedades.forEach { enfermedad => 
        	enfermedad.atenuatePara(self, unaDosis)
        }
    }

    method curarseDe(unaEnfermedad) {
        enfermedades.remove(unaEnfermedad)
    }

    method temperatura() {
        return temperatura
    }
    
    method morir() {
        temperatura = 0
    }

	method intentarDonarA(unaPersona, unasCelulas) {
		self.validarDonacion(unaPersona, unasCelulas)
		self.destruirCantidadCelulas(unasCelulas)
		unaPersona.recibirCantidadCelulas(unasCelulas)
	}
	
	method validarDonacion(unaPersona, unasCelulas) {
		self.validarFactorSanguineoCompatible(unaPersona)
		self.validarCantidadDeCelulasSuficientes(unasCelulas)
	}
	
	method validarCantidadDeCelulasSuficientes(unasCelulas) {
		if (!self.tieneCelulasSuficientes(unasCelulas)) {
			throw celulasInsuficientesException			
		}
	}
	
	method validarFactorSanguineoCompatible(unaPersona) {
		if (!self.esCompatibleCon(unaPersona.factorSanguineo())) {
			throw incompatibleException
		}
	}
	
	method puedeDonarA(unaPersona, unasCelulas) {
		return self.esCompatibleCon(unaPersona.factorSanguineo()) and
			self.tieneCelulasSuficientes(unasCelulas)
	}

	method tieneCelulasSuficientes(unasCelulas) {
		return cantidadCelulas / 4 >= unasCelulas and unasCelulas > 500
	} 

	method esCompatibleCon(unFactorSanguineo) {
		return factorSanguineo.puedeDonarA(unFactorSanguineo)
	}
	
	method recibirCantidadCelulas(unasCelulas) {
		cantidadCelulas += unasCelulas
	}
}
