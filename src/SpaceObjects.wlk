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
	var contador = 0
	//var property position = game.at(reloj.position().down(1).x(),reloj.position().down(1).y())
	method text() = contador.toString()
	/*method posicionInicial() {
		position = reloj.position().down(1)
	}
	/*method posicionFinal(){
		position = puntuacion.position().rigth(1)
	}*/
	method position() = puntuacion.position().right(1)
	method sumarPunto(){
		contador += 1
	}
	method reiniciar(){
		contador = 0
	}
}

object reloj {
	var property tiempo = 0
	var property position = game.at(1, game.height()-1)
	method text() = tiempo.toString()
	
	method posicionInicial(){
		position = game.at(1, game.height()-1)
	} 
	method posicionFinal(){
		position = game.at(9,9)
	}
	method pasarTiempo() {
		tiempo = tiempo +1
		if(tiempo==10)
			self.detener()
	}
	method iniciar(){
		tiempo = 0
		game.onTick(1000,"tiempo",{self.pasarTiempo()})
	}
	method reiniciar(){
		tiempo=0
	}
	method detener(){
		game.removeTickEvent("tiempo")
		game.removeTickEvent("movimiento1")
		game.removeTickEvent("movimiento2")
		game.removeTickEvent("movimiento3")
		keyboard.left().onPressDo({bala.nada()}) // la idea es que esto deje de mover
		keyboard.right().onPressDo({bala.nada()}) // al alien pero no funca
		keyboard.space().onPressDo({bala.nada()})
		gameOver.colocar()
		self.posicionFinal()
		//tiempo_.posicionFinal()
		puntuacion.posicionFinal()
		instruccionRestart.posicionFinal()
	}
}

object tiempo_ {
	var property position
	const textoReloj = "Tiempo:"
	method text() = textoReloj.toString()
	method position() = reloj.position().left(1)
	method posicionFinal(){
		self.position(game.at(8,8))
	}
}

object puntuacion {
	const puntuacion = "Puntuación:"
	var property position = reloj.position().down(1).left(1)
	method text() = puntuacion.toString()
	method posicionInicial(){
		position = reloj.position().down(1).left(1)
	} 
	method posicionFinal(){
		position = game.at(14,9)//.rigth(3)
	}
}

object instruccion {
	var property position = game.at(4,2)
	const movimiento = 	
"MOVE WITH  <-  ->
SHOOT WITH SPACE
PRESS ENTER TO START"
	method text() = movimiento.toString()
	method posicionInicial(){
		position = game.at(4,2)
	}
	method quitar(){
		position = game.at(-5,-5)
	} 
	
}

object gameOver{
	var property position = game.at(-55,200)
	method quitar(){
		position = game.at(-55,200)
	}
	method image() = "imagenes_Juego/gameOver.png"
	method colocar(){
		position = game.at(0,-6)
	}
}

object instruccionRestart {
	var property position = game.at(-7,-7)
	const instruccionRestart = "           PRESS R TO RESTART"
	method text() = instruccionRestart.toString()
	method posicionFinal(){
		position = game.at(11,10)
	}
	method quitar(){
		position = game.at(-7,-7)
	} 
}