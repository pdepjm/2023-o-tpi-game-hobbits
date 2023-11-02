import wollok.game.*

class Sonido{
	
	var nobreSonido
	method play(){
		game.sound("sonidos/" + nobreSonido +".wav").play()
	}
} 

const disparo = new Sonido  (nobreSonido = "sonido_bala")
const mejorarNave = new Sonido  (nobreSonido = "PowerUp2")
const meteoro = new Sonido  (nobreSonido = "meteoro")
const alien = new Sonido  (nobreSonido = "sonidoAlien2")
