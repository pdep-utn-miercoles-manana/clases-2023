import PersonalDeSalud.*

class JefeDeDepartamento inherits PersonalDeSalud {
    const subordinados = #{}

    override method atenderA(unaPersona) {
        subordinados.anyOne().atenderA(unaPersona)
    }
    
    method subordinarA(unMedico) {
        subordinados.add(unMedico)
    }
}
