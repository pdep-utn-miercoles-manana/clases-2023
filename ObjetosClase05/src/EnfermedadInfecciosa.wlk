import Enfermedad.*

class EnfermedadInfecciosa inherits Enfermedad {
    method reproducirse() {
        cantidadCelulasAmenazadas *= 2
    }

    method afectarA(unaPersona) {
        unaPersona.aumentarTemperatura(self.cantidadCelulasAmenazadas() / 1000)
    }

    method esAgresivaPara(unaPersona) {
        return self.cantidadCelulasAmenazadas() > unaPersona.cantidadCelulas() / 10
    }
}

