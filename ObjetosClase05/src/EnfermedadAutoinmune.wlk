import Enfermedad.*

class EnfermedadAutoinmune inherits Enfermedad {
    var cantidadDias = 0

    method afectarA(unaPersona) {
        unaPersona.destruirCantidadCelulas(self.cantidadCelulasAmenazadas())
        cantidadDias ++
    }

    method esAgresivaPara(unaPersona) {
        return cantidadDias > 30
    }
}
