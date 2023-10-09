import wollok.game.*

object alien {

	var property position = game.at(0,0)
	//method position() = game.center()
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
	
	method image() = "imagenes_Juego/alien.png"

}

object nave {

	var property position = game.at(0,0)
	//method position() = game.center()
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
	
	method image() = "imagenes_Juego/nave-cheta.png"

}

object nave2 {

	var property position = game.at(0,0)
	//method position() = game.center()
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
	
	method image() = "imagenes_Juego/nave-white.png"

}
