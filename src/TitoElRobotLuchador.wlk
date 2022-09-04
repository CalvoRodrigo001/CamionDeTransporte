object tito {
	var bateria = 1000 
	
	var municion = 800
	
	var enemigos = 1
	
	var puntosDeVida = 1000
	
	var distanciaRecorrida = 0
	
	method enciendeTito(){
		return "Tito ahora esta prendido y listo para andar!"
	}
	
	method holaTito(){
		return "¡hola!, aqui tito tu robot!"
	}
	
	method bateria(){
		return  bateria
	}
	
	method andar(metros){
		bateria -=  (20 * metros)
		distanciaRecorrida += metros
		
	}
	
	method recargarBateria(tiempoARecargar){
		bateria +=  (3 * tiempoARecargar)
	}
	
	method municion(){
		return municion
	}
	
	method recargarMunicion(cantidadARecargar){
		municion += cantidadARecargar
	}
	
	method reparar(){
		if(bateria >= 400 && puntosDeVida < 1000){
			bateria -=  300 
			puntosDeVida +=  100
		}
		
	}
	
	method dispararAlEnemigo(){
		if(enemigos >= 1 && municion >= 90 && puntosDeVida >=200 && bateria > 300){
		municion -=   90
		enemigos -=   1
		puntosDeVida -=  100
		bateria -= 100
		}
	}
	
	method enemigosRestantes(){
		return enemigos
	}
	
	
	method puntosDeVida(){
		return puntosDeVida
	}
	
	method zonaDespejada(){
		return enemigos <1
	}
	
	method pasarALaSiguienteZona(){
		if(enemigos <1  && bateria >= 500){
			enemigos += 20
			distanciaRecorrida += 1000
		}
		
	}
	
}




