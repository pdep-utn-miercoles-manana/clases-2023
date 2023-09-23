class Enfermedad {
    var cantidadCelulasAmenazadas

    method cantidadCelulasAmenazadas() {
        return cantidadCelulasAmenazadas
    }

    method atenuarseEn(unaCantidadDeCelulas) {
        cantidadCelulasAmenazadas = 0.max(cantidadCelulasAmenazadas - unaCantidadDeCelulas)
    }

    method atenuatePara(unaPersona, unaDosis) {
        self.atenuarseEn(unaDosis * 15)
        self.validarCuracion(unaPersona)
    }

    method validarCuracion(unaPersona) {
        if (self.cantidadCelulasAmenazadas() == 0) {
            unaPersona.curarseDe(self)
        }
    }
}

object muerte {    
    method cantidadCelulasAmenazadas() {
        return 0
    }

    method atenuatePara(_unaPersona, _unaDosis) {
        // No hace nada porque no se atenúa
    }

    method afectarA(unaPersona) {
        unaPersona.morir()
    }

    method esAgresivaPara(_unaPersona) {
        return true
    }
}

class HIV {
    const autoinmune
    const infecciosa
    
    method cantidadCelulasAmenazadas() {
        return autoinmune.cantidadCelulasAmenazadas() + 
        	infecciosa.cantidadCelulasAmenazadas()
    }

    method atenuatePara(unaPersona, unaDosis) {
        infecciosa.atenuatePara(unaPersona, unaDosis)
        autoinmune.atenuatePara(unaPersona, unaDosis)
    }

    method afectarA(unaPersona) {
        infecciosa.afectarA(unaPersona)
        autoinmune.afectarA(unaPersona)
    }

    method esAgresivaPara(unaPersona) {
        return infecciosa.esAgresivaPara(unaPersona) 
        	&& autoinmune.esAgresivaPara(unaPersona)
    }
}
