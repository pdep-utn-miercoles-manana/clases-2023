import Persona.*

class PersonalDeSalud inherits Persona {
    override method contraer(unaEnfermedad) {
        super(unaEnfermedad)
        self.atenderA(self)
    }
    
    method atenderA(unaPersona)
}
