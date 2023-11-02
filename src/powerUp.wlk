import wollok.game.*
import Naves.*
import sonidos.*
import Configuracion.*

class Colisionado{
	var property position = game.at(self.aleatorioHorizontal(),6)
	var imagen
	method aleatorioHorizontal() = 0.randomUpTo(13)
	method recibirDisparo(mult) {}
	method chocarConNave(nave){}
	method bajar(){
		position = position.down(1)
	}
	method image() = imagen
	
}

class PowerUp inherits Colisionado{
	
	var property multiplicador
	override method chocarConNave(nave)
	{
		game.removeVisual(self)
		mejorarNave.play()
		//game.removeTickEvent("bajar")
		nave.modificarMultiplicador(self.multiplicador())
		game.schedule(3000,{nave.multiplicador(1)})
		game.addVisual(powerUpx2)
		game.schedule(3000,{game.removeVisual(powerUpx2)})
	}
}
class Meteorito inherits Colisionado{
	
	override method chocarConNave(nave)
	{
		game.removeVisual(self)
		//game.removeTickEvent("bajar1")
		contador.sumarPunto(-1)
		meteoro.play()
	}
	
}

object entorno{
	method recibirDisparo(mult) {}
	method spawnearPowerUp(){
		const powerUp = new PowerUp(multiplicador=2,imagen="imagenes/star.png")
		game.addVisual(powerUp)
		game.onCollideDo(naveBlack, 
			{colisionado => naveBlack.chocarCon(colisionado)
			
		})
		//game.whenCollideDo(naveBlack, {=>mejorarNave.play()})
		game.onTick(200,"bajar",{powerUp.bajar()})
		if(powerUp.position().y() == 0) { 
			game.removeVisual(powerUp) // cuando llega a la altura maxima del tablero vuelve a pos inicial
			game.removeTickEvent("bajar") // reinicia el tick, sino se acoplan
		}
	}
	method spawnearMeteorito()
	{
		const meteorito = new Meteorito(imagen="imagenes/fuego22.png")
		game.addVisual(meteorito)
		game.onCollideDo(naveBlack, {colisionado => naveBlack.chocarCon(colisionado)})
		//game.whenCollideDo(naveBlack, {=>mejorarNave.play()})
		game.onTick(200,"bajar1",{meteorito.bajar()})
		if(meteorito.position().y() == 0) { 
			game.removeVisual(meteorito) // cuando llega a la altura maxima del tablero vuelve a pos inicial
			game.removeTickEvent("bajar1") // reinicia el tick, sino se acoplan
		}
	}
}

object powerUpx2{
	var property position = game.at(0,3)
	method image() = "imagenes/star.png"
	method recibirDisparo(mult){}
}
