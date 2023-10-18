import SpaceObjects.*
import wollok.game.*


class Alien {
	//var property position = game.at(0,10) ORIGINAL
	var property position = game.at(11,7) // POSICION DE PRUEBA DE COLISION
	var numero 
	
	var vida = 100
	
 	method movete() {
    const x = 0.randomUpTo(game.width()-2).truncate(0)
    const y = 5.randomUpTo(game.height()-2).truncate(0)
    position = game.at(x,y) 
  }
    method recibirDisparo(){
    	vida = vida - 100
    	bala.position(game.at(-1,0))
    	if(vida <= 0){
    		//self.morir()
    		contador.sumarPunto()
    	}
    }
	
	method morir(){
		game.removeTickEvent("movimiento" + numero) //detiene el movimiento del alien, SI SE ACTIVA EL MOVIMIENTO ALEATORIO DEL ALIEN ACTIVAR ESTO TMB
		position = game.at(0,-10) // lo envia fuera del tablero, simulando su muerte
	}
	
	method image() = "imagenes_Juego/alien.png"
}

const alien1 = new Alien(position=game.at(11,7),numero=1)
const alien2 = new Alien(position=game.at(4,7),numero=2)
const alien3 = new Alien(position=game.at(18,7),numero=3)


/* ALIEN VIEJOS 
object alien1 {

	//var property position = game.at(0,10) ORIGINAL
	var property position = game.at(11,7) // POSICION DE PRUEBA DE COLISION
	//method position() = game.center()
	
	var vida = 100
	
 	method movete() {
    //const x = 0.randomUpTo(game.width()).truncate(0)
    //const y = 0.randomUpTo(game.height()).truncate(0)
    const x = 0.randomUpTo(game.width()-2).truncate(0)
    const y = 5.randomUpTo(game.height()-2).truncate(0)
    // otra forma de generar números aleatorios
    // const x = (0.. game.width()-1).anyOne() 
    // const y = (0.. game.height()-1).anyOne() 
    position = game.at(x,y) 
  }
    method recibirDisparo(){
    	vida = vida - 50
    	//game.removeTickEvent("disparo") //esto deberia detener el movimiento de la bala para que vuelva a su posicion inicial, PERO DA ERROR
    	bala.position(game.at(-1,0))
    	if(vida <= 0)
    		self.morir()
    }
	
	method morir(){
		game.removeTickEvent("movimiento1") //detiene el movimiento del alien, SI SE ACTIVA EL MOVIMIENTO ALEATORIO DEL ALIEN ACTIVAR ESTO TMB
		position = game.at(0,-10) // lo envia fuera del tablero, simulando su muerte
	}
	
	method image() = "imagenes_Juego/alien.png"

}

object alien2 {
	var property position = game.at(4,7) // POSICION DE PRUEBA DE COLISION

	
	var vida = 100
	
 	method movete() {
    const x = 0.randomUpTo(game.width()-2).truncate(0)
    const y = 5.randomUpTo(game.height()-2).truncate(0)
    position = game.at(x,y) 
  }
    method recibirDisparo(){
    	vida = vida - 50
    	//game.removeTickEvent("disparo") //esto deberia detener el movimiento de la bala para que vuelva a su posicion inicial, PERO DA ERROR
    	bala.posicionInicial()
    	if(vida <= 0)
    		self.morir()
    }
	method morir(){
		game.removeTickEvent("movimiento2") //detiene el movimiento del alien, SI SE ACTIVA EL MOVIMIENTO ALEATORIO DEL ALIEN ACTIVAR ESTO TMB
		position = game.at(0,-10) // lo envia fuera del tablero, simulando su muerte
	}
	method image() = "imagenes_Juego/alien.png"
}

object alien3 {
	var property position = game.at(18,7) // POSICION DE PRUEBA DE COLISION
	
	var vida = 100
	
 	method movete() {
    const x = 0.randomUpTo(game.width()-2).truncate(0)
    const y = 5.randomUpTo(game.height()-2).truncate(0)
    position = game.at(x,y) 
  }
    method recibirDisparo(){
    	vida = vida - 50
    	//game.removeTickEvent("disparo") //esto deberia detener el movimiento de la bala para que vuelva a su posicion inicial, PERO DA ERROR
    	bala.posicionInicial()
    	if(vida <= 0)
    		self.morir()
    }
	method morir(){
		game.removeTickEvent("movimiento3") //detiene el movimiento del alien, SI SE ACTIVA EL MOVIMIENTO ALEATORIO DEL ALIEN ACTIVAR ESTO TMB
		position = game.at(0,-10) // lo envia fuera del tablero, simulando su muerte
	}
	method image() = "imagenes_Juego/alien.png"
}*/