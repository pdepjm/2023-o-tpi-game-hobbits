import wollok.game.*


object naveBlack{

	var property position = game.at(11,0)
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
	method disparar(bala){
		if(bala.position().x() == -1 ){ 
		//solo dispara si la bala esta en pos inicial
		//si no esta en pos inicial, significa q esta volando todavia
			bala.position(position.up(1).right(1))
			game.onTick(50,"disparo",{ bala.disparo()})
		}
	}
	method image() = "imagenes/nave-black100.png"

}

object naveWhite{

	var property position = game.at(0,0)
	//method position() = game.center()
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
	
	method image() = "imagenes/nave-white.png"

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
	
	method image() = "imagenes/nave.png"

}

object bala {
	// arranca fuera de tablero
	var property position = self.posicionInicial()
	method posicionInicial() = game.at(-1,0)
	method disparo() {
		position = position.up(1)
		if(position.y() == game.height()) { 
			position = self.posicionInicial() // cuando llega a la altura maxima del tablero vuelve a pos inicial
			game.removeTickEvent("disparo") // reinicia el tick, sino se acoplan
			}
	}
	method nada(){}//={}
	method image() = "balas/bala_blanca2.png" // hay q cambiarla
} 
