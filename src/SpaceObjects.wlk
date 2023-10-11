import wollok.game.*

object alien {

	//var property position = game.at(0,10) ORIGINAL
	var property position = game.at(5,5) // POSICION DE PRUEBA DE COLISION
	//method position() = game.center()
	
	var vida = 100
	
 	method movete() {
    const x = 0.randomUpTo(game.width()).truncate(0)
    const y = 0.randomUpTo(game.height()).truncate(0)
    // otra forma de generar números aleatorios
    // const x = (0.. game.width()-1).anyOne() 
    // const y = (0.. game.height()-1).anyOne() 
    position = game.at(x,y) 
  }
    method recibirDisparo(){
    	vida = vida - 50
    	//game.removeTickEvent("disparo") esto deberia detener el movimiento de la bala para que vuelva a su posicion inicial, PERO DA ERROR
    	bala.posicionInicial()
    	if(vida <= 0)
    		self.morir()
    }
	
	method morir(){
		//game.removeTickEvent("movimiento") detiene el movimiento del alien, SI SE ACTIVA EL MOVIMIENTO ALEATORIO DEL ALIEN ACTIVAR ESTO TMB
		position = game.at(0,-10) // lo envia fuera del tablero, simulando su muerte
	}
	
	method image() = "imagenes_Juego/alien.png"

}

object naveCheta{

	var property position = game.at(0,0)
	//method position() = game.center()
	
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
			game.onTick(250,"disparo",{ bala.disparo()})
		}
	}
	method image() = "imagenes_Juego/nave-cheta.png"

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
	
	method image() = "imagenes_Juego/nave-white.png"

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
	
	method image() = "imagenes_Juego/nave.png"

}

object bala {
	// arranca fuera de tablero
	var property position = self.posicionInicial()
	method posicionInicial() = game.at(-1,0)
	method disparo() {
		position = position.up(1)
		if(position.y() == 12) { 
			position = self.posicionInicial() // cuando llega a la altura maxima del tablero vuelve a pos inicial
			game.removeTickEvent("disparo") // reinicia el tick, sino se acoplan
			}
	}
	method image() = "imagenes_Juego/bala.png" // hay q cambiarla
}
