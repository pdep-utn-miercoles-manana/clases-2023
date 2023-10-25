class TiroDeDados {
	const dado1 = self.tirarUnDado()
	const dado2 = self.tirarUnDado()
	
	method valor() = dado1 + dado2
	method fueDoble() = dado1 == dado2
	
	method tirarUnDado() = (1..6).anyOne()
}
