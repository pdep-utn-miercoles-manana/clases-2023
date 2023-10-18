import wollok.game.*
import hugo.*
import barril.*

object juego {
	method inicializar() {
		game.width(32)
		game.height(18)
		
		game.addVisualCharacter(hugo)
		
		20.times { vez => game.addVisual(new Barril()) }
		
		game.onCollideDo(hugo,
			{ elemento => self.tomarDelBarril(elemento) }
		)
		
		keyboard.space().onPressDo { hugo.puedeManejar() }
		
		game.onTick(1000, "Alguien que hable", { self.buscarVisualYHablar() })
		
		game.schedule(20000, { game.removeTickEvent("Alguien que hable") })
	}
	
	method buscarVisualYHablar() {
		game.allVisuals().anyOne().hablar()
	}
	
	method tomarDelBarril(barril) {
		hugo.embriagarse()
		game.removeVisual(barril)
	}
}
