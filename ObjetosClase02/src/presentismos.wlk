object presentismoNulo {
	method bonoPara(_unasFaltas) {
		return 0
	} 
}

object presentismoPorFaltas {
	method bonoPara(unasFaltas) {
		if (unasFaltas == 0) {
			return 100
		} else if (unasFaltas == 1) {
			return 50
		} else {
			return 0
		}
	}
}
