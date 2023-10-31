import wollok.game.*
import Naves.*

class PowerUp{
	var property position = game.at(self.aleatorioHorizontal(),6)
	var property multiplicador
	var imagen
	method aleatorioHorizontal() = 0.randomUpTo(13)
	method recibirDisparo(mult) {}
	
	method bajar(){
		position = position.down(1)
	}

	
	method image() = imagen
}

object entorno{
	method recibirDisparo(mult) {}
	method spawnearPowerUp(){
		const powerUp = new PowerUp(multiplicador=2,imagen="imagenes/star.png")
		game.addVisual(powerUp)
		game.whenCollideDo(naveBlack, {powerUp => naveBlack.recibirPowerUp(powerUp)})
		game.onTick(200,"bajar",{powerUp.bajar()})
		if(powerUp.position().y() == 0) { 
			game.removeVisual(powerUp) // cuando llega a la altura maxima del tablero vuelve a pos inicial
			game.removeTickEvent("bajar") // reinicia el tick, sino se acoplan
		}
	}
}
