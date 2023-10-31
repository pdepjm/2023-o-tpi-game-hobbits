import wollok.game.*
import wollok.game.*
import Naves.*
import enemigos.*
import sonidos.*
import Naves.*
import powerUp.*

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
	method sumarPunto(valor){
		contador += valor
	}
	method reiniciar(){
		contador = 0
	}
	method recibirDisparo(mult){}
}

object reloj {
	var property tiempo = 0
	var property position = game.at(1, game.height()-1)
	method text() = tiempo.toString()
	
	method posicionInicial(){
		position = game.at(1, game.height()-1)
	} 
	method posicionFinal(){
		position = game.at(5,4)
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
		self.posicionFinal()
		interfaz.posicionesFinales()
	}
	method recibirDisparo(mult){}
}

object tiempo_ {
	var property position
	const textoReloj = "   Tiempo:"
	method text() = textoReloj.toString()
	method position() = reloj.position().left(1)
	method posicionFinal(){
		self.position(game.at(8,8))
	}
	method recibirDisparo(mult){}
}

object puntuacion {
	const puntuacion = "          Puntuación:"
	var property position = reloj.position().down(1).left(1)
	method text() = puntuacion.toString()
	method posicionInicial(){
		position = reloj.position().down(1).left(1)
	} 
	method posicionFinal(){
		position = reloj.position().right(2)//.rigth(3)
	}
	method recibirDisparo(mult){}
}

object instruccion {
	var property position = game.at(3,1)
	const movimiento = 	
"MOVE WITH  <-  ->
SHOOT WITH SPACE
PRESS ENTER TO START"
	method text() = movimiento.toString()
	method posicionInicial(){
		game.addVisual(self)
	}
	method quitar(){
		game.removeVisual(self)
	} 
	
}

object gameOver{
	var property position = game.at(0,-3)
	method quitar(){
		game.removeVisual(self)
	}
	method image() = "imagenes/gameOver.png"
	method colocar(){
		game.addVisual(self)
	}
	method recibirDisparo(mult){}
}

object instruccionRestart {
	var property position = game.center().up(2)
	const instruccionRestart = "           PRESS R TO RESTART"
	method text() = instruccionRestart.toString()
	method posicionFinal(){
		game.addVisual(self)
	}
	method quitar(){
		game.removeVisual(self)
	} 
	method recibirDisparo(mult){}
}

object interfaz {
	method empezarJuego(){
		self.comenzarMovimiento()
  		self.desbloquearTeclas()
  		self.hacerAparecerPowerUps()
		start.fueraStart()
		instruccion.quitar()
		game.addVisual(reloj)
		reloj.iniciar()
		game.addVisual(contador)
		game.addVisual(tiempo_)
		game.addVisual(puntuacion)
	}
	method comenzarMovimiento(){
		game.onTick(2000, "movimiento1", { alien1.movete() })
  		game.onTick(2000, "movimiento3", { alien3.movete() })
  		game.onTick(2000, "movimiento2", { alien2.movete() })
	}
	method desbloquearTeclas(){
		keyboard.left().onPressDo( { naveBlack.moverseHaciaIzquierda() } )
		keyboard.right().onPressDo( { naveBlack.moverseHaciaDerecha() } )
		keyboard.space().onPressDo( { naveBlack.disparar()})
		keyboard.space().onPressDo( { disparo.play()})
	}
	method hacerAparecerPowerUps(){
		game.onTick(3000,"powerup",{entorno.spawnearPowerUp()})
	}
	method posicionesFinales(){
		game.removeTickEvent("movimiento1")
		game.removeTickEvent("movimiento2")
		game.removeTickEvent("movimiento3")
		game.removeTickEvent("powerup")
		gameOver.colocar()
		puntuacion.posicionFinal()
		instruccionRestart.posicionFinal()
	}
	method restart(){
		game.clear()
		game.allVisuals()
		naveBlack.modificarMultiplicador(1)
		alien2.position(game.center().up(1))
		alien1.position(alien2.position().left(3))
		alien3.position(alien2.position().right(3))
		reloj.reiniciar()
		contador.reiniciar()
		reloj.posicionInicial()
		puntuacion.posicionInicial()
		reloj.iniciar()	
		self.comenzarMovimiento()
		self.hacerAparecerPowerUps()
		gameOver.quitar()
		instruccionRestart.quitar()
		
	}
}


object start {
	var property position = game.at(0,1)
	method fueraStart() {
		game.removeVisual(self)
	}
	method posicionInicial(){
		game.addVisual(self)
	}
	method image() = "imagenes/start1.png"
}
