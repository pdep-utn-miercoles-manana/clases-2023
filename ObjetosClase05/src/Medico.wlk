import PersonalDeSalud.*

class Medico inherits PersonalDeSalud {
    const dosis

    override method atenderA(unaPersona) {
        unaPersona.medicateCon(dosis)
    }
}
