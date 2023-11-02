import wollok.game.*
import powerUp.*
import Configuracion.*

object naveBlack{

	var property position = game.at(7,0).left(1)
	var property multiplicador = 1

	
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
			game.onCollideDo(bala1, { enemigo => bala1.impactar(enemigo,multiplicador)})
			//game.onCollideDo(alien, { bala => alien.colisionarCon(bala,multiplicador)})
			game.onTick(50,"disparo",{ bala1.disparo()})
			if(bala1.position().y() == game.height()) { 
				game.removeVisual(bala1) // cuando llega a la altura maxima del tablero vuelve a pos inicial
				game.removeTickEvent("disparo") // reinicia el tick, sino se acoplan
			}
	}
	method chocarCon(colisionado){
		colisionado.chocarConNave(self)
	}
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
		{game.removeVisual(self)
			game.removeTickEvent("disparo")
		}
		alien.recibirDisparo(multiplicador)
	}
	
/*
	method chocarConAlien(alien,multiplicador)
	{
		if(game.hasVisual(self){game.removeVisual(self)}
		//game.removeTickEvent("disparo")
		alien.movete()
		contador.sumarPunto(alien.puntos()*multiplicador)
	}*/
	method nada(){}//={}
	method image() = "balas/bala_fix.png" // hay q cambiarla
} 
