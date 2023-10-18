import wollok.game.*



object naveCheta{

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
	method nada(){}//={}
	method image() = "balas/bala_blanca2.png" // hay q cambiarla
}

object contador {
	var puntuacion = 0
	method text() = puntuacion.toString()
	method position() = reloj.position().down(1)
	method sumarPunto(){
		puntuacion += 1
	}
}

object reloj {
	var property tiempo = 0
	
	method text() = tiempo.toString()
	
	method position() = game.at(1, game.height()-1)
	
	method pasarTiempo() {
		tiempo = tiempo +1
		if(tiempo==5)
			self.detener()
	}
	method iniciar(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method detener(){
		game.removeTickEvent("tiempo")
		game.removeTickEvent("movimiento1")
		game.removeTickEvent("movimiento2")
		game.removeTickEvent("movimiento3")
		keyboard.left().onPressDo({bala.nada()}) // la idea es que esto deje de mover
		keyboard.right().onPressDo({bala.nada()}) // al alien pero no funca
		keyboard.space().onPressDo({bala.nada()})
	}
}

object tiempo {
	const textoReloj = "Tiempo:"
	method text() = textoReloj.toString()
	method position() = reloj.position().left(1)
}

object puntuacion {
	const puntuacion = "Puntuación:"
	method text() = puntuacion.toString()
	method position() = contador.position().left(1)
}