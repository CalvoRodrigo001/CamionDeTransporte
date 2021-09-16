import cosas.*

object camion {
	const property cosas = []
	var pesoCarga = 0
	
	method cargar(cosa) {
		cosas.add(cosa)
		pesoCarga += cosa.peso()
	}
	method descargar(cosa) {
		cosas.remove(cosa)
		pesoCarga -= cosa.peso()
	}
    method todoPesoPar(){
    	return cosas.all({cosa => cosa.peso().even()})
    }
    method hayAlgunoQuePesa(peso){
    	return cosas.any({cosa => cosa.peso() == peso})    	
    }
    method elDeNivel(nivel){
    	return cosas.find({cosa => cosa.nivelPeligrosidad() == nivel})
    }
    method pesoTotal()=return pesoCarga + 1000
    method excedidoDePeso()= self.pesoTotal()>2500

    method objetosQueSuperanPeligrosidad(nivel){
    	return cosas.filter({cosa => cosa.nivelPeligrosidad() > nivel})
    }
    method objetosMasPeligrososQue(cosaAComparar){
    	return cosas.filter({cosa => cosa.nivelPeligrosidad()>cosaAComparar.nivelPeligrosidad()})
    }
    method puedeCircularEnRuta(nivelMaximoPeligrosidad){
    	return not (self.excedidoDePeso() and cosas.filter({self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad)}))
    }
    
    method tieneAlgoQuePesaEntre(min,max)=cosas.filter({cosa => cosa.peso().between(min,max)})
    method cosaMasPesada()=cosas.find({cosas.max({cosa=> cosa.peso()})})
    method pesos()=cosas.map({cosa=>cosa.peso()})
}
