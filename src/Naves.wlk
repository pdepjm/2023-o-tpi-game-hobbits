import wollok.game.*
import powerUp.*
/* 
object naveBlack{

	var property position = game.at(7,0).left(1)
	
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
			bala.position(position.up(1))
			game.onTick(50,"disparo",{ bala.disparo()})
		}
	}
	method image() = "imagenes/nave-black100.png"

}*/
object naveBlack{

	var property position = game.at(7,0).left(1)
	var multiplicador = 1
	
	method moverseHaciaIzquierda(){
		self.position(position.left(1))
	}
	
	method moverseHaciaDerecha(){
		self.position(position.right(1))
	}
	method quitar(algo){
		game.removeVisual(algo)
	}
	method disparar(){
			const bala1 = new Bala()
			game.addVisual(bala1)
			game.whenCollideDo(bala1, { enemigo => bala1.impactar(enemigo,multiplicador)})
			game.onTick(50,"disparo",{ bala1.disparo()})
			if(bala1.position().y() == game.height()) { 
				game.removeVisual(bala1) // cuando llega a la altura maxima del tablero vuelve a pos inicial
				game.removeTickEvent("disparo") // reinicia el tick, sino se acoplan
			}
	}
	method recibirPowerUp(powerUp){
		game.removeVisual(powerUp)
		self.modificarMultiplicador(powerUp.multiplicador())
	}
	method modificarMultiplicador(nuevo_mult){multiplicador = nuevo_mult}
	method image() = "imagenes/nave-black100.png"

}

class Bala {
	var property position = self.posicionInicial()
	method posicionInicial() = naveBlack.position().up(1)
	method disparo() {
		position = position.up(1)
	}
	method recibirDisparo(mult){}
	method impactar(alien,multiplicador){
		if(game.hasVisual(self))
		{game.removeVisual(self)}
		//game.removeTickEvent("disparo")
		alien.recibirDisparo(multiplicador)
	}
	method nada(){}//={}
	method image() = "balas/bala_fix.png" // hay q cambiarla
} 

/* 

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
*/