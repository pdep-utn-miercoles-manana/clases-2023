import Medico.*

class JefeDeDepartamento inherits Medico(dosis = 0) {
    const subordinados = #{}

    override method atenderA(unaPersona) {
        subordinados.anyOne().atenderA(unaPersona)
    }
    
    method subordinarA(unMedico) {
        subordinados.add(unMedico)
    }
}
