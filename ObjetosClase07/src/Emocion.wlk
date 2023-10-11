import Persona.*

class EmocionGenerica {
	method asentarPara(_unaPersona, _unRecuerdo) {
		// No hace nada!
	}

	method niega(_otraEmocion) = false
	
	method esAlegre() = false
}

object alegria {
	method asentarPara(unaPersona, unRecuerdo) {
		if (unaPersona.felicidad() > 500) {
			unaPersona.centralizar(unRecuerdo)
		}
	}

	method niega(otraEmocion) = not otraEmocion.esAlegre()
	
	method esAlegre() = true
}

object tristeza {
	method asentarPara(unaPersona, unRecuerdo) {
		unaPersona.centralizar(unRecuerdo)
		unaPersona.entristecerse(10)
	}

	method niega(otraEmocion) = otraEmocion.esAlegre()
	
	method esAlegre() = false
}

class EmocionCompuesta {
	const emociones

	method asentarPara(unaPersona, unRecuerdo) {
		emociones.forEach { emocion => emocion.asentarPara(unaPersona, unRecuerdo) }
	}
	
	method niega(otraEmocion) = emociones.all { emocion => emocion.niega(otraEmocion) }
	
	method esAlegre() = emociones.any { emocion => emocion.esAlegre() }
}

const furioso = new EmocionGenerica()
const disgusto = new EmocionGenerica()
const temeroso = new EmocionGenerica()
