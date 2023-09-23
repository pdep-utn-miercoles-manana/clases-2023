# Dr. Casa

Enunciado: https://docs.google.com/document/d/1A3DrHQQr3iSkuDbgUhDZkfiCejcUMvc6knZ4r4z1bpY

## Diagrama de Clases

![imagen](https://yuml.me/5f3caada.jpg)

<!--

https://yuml.me/

[Persona|temperatura;cantidadCelulas|contraer(unaEnfermedad);vivirUnDia();enfermedadMasAmenazante();estaEnComa();cantidadDeCelulasAmenazantesPorEngfermedadesAgresivas();medicateCon();curarseDe();morir();intentarDonarA(unaPersona, unasCelulas);puedeDonarA(unaPersona, unasCelulas);validarDonacion(unaPersona, unasCelulas)]

[Medico|dosis|atenderA(unaPersona);contraer(unaEnfermedad)]

[JefeDeDepartamento||atenderA(unaPersona)]

[<<interfaz>>Afeccion|cantidadCelulasAmenazadas();atenuatePara(unaPersona, unaDosis);afectarA(unaPersona);esAgresivaPara(unaPersona)]

[muerte||cantidadCelulasAmenazadas();atenuatePara(unaPersona, unaDosis);afectarA(unaPersona);esAgresivaPara(unaPersona)]

[<<abstracta>>Enfermedad|cantidadCelulasAmenazadas|cantidadCelulasAmenazadas();atenuatePara(unaPersona, unaDosis)]

[EnfermedadInfecciosa||reproducirse();afectarA(unaPersona);esAgresivaPara(unaPersona)]

[EnfermedadAutoinmune|cantidadDias|afectarA(unaPersona);esAgresivaPara(unaPersona)]

[<<interfaz>>FactorSanguineo||puedeDonarA(otroFactorSanguineo)]

[Persona]-enfermedades*>[<<interfaz>>Afeccion]
[Persona]^-[Medico]
[Medico]^-[JefeDeDepartamento]
[Medico]<subordinados*-[JefeDeDepartamento]
[<<interfaz>>Afeccion]^-[<<abstracta>>Enfermedad]
[<<abstracta>>Enfermedad]^-[EnfermedadInfecciosa]
[<<abstracta>>Enfermedad]^-[EnfermedadAutoinmune]
[<<interfaz>>Afeccion]^-[muerte]
[Persona]-factorSanguineo>[<<interfaz>>FactorSanguineo]

[<<interfaz>>FactorSanguineo]^-[factorA||puedeDonarA(otroFactorSanguineo)]
[<<interfaz>>FactorSanguineo]^-[factorR||puedeDonarA(otroFactorSanguineo)]
[<<interfaz>>FactorSanguineo]^-[factorO||puedeDonarA(otroFactorSanguineo)]

 -->

## Decisiones

* Al principio se decidió que `JefeDeDepartamento` herede de `Persona` ya que no tenía sentido que lo haga de la clase `Medico` porque este no tiene dosis y tampoco atiende a las personas de la misma manera que el médico. Luego, vimos que contrae enfermedad exactamente igual que el médico, por lo que se cambió la herencia para que ahora sí extienda de la clase `Medico`. Lo que genera ruido es que también hereda un atributo `dosis` que no usa, que por el momento se pisó para que retorne cero

* Para el punto 5 se decidió que la muerte sea polimórfica con la efermedad. Habría que ver si realmente tiene sentido, pero por el momento nos alcanza.

* Para agregar una nueva enfermedad solo hace falta que implemente la interfaz `Afeccion`

* ¿Cómo podemos tener una enfermedad que actue exactamente igual que una autoinmune y una infecciosa? Debido a que no podemos heredar de dos clases distintas, podemos hacer una clase nueva, que implemente la interfaz `Afeccion` y que conozca una enfermedad autoinmune y una infecciosa. De esa manera no hereda de ninguna de estas pero su comportamiento es **compuesto** por el de ambas enfermedades.
