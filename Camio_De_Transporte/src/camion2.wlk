import cosas.*

object camion {

	const property cosas = []
	var pesoCarga = 0
	// bultos y consecuencias
	var bultosCargados = 0

	method cargar(unaCosa) {
		cosas.add(unaCosa)
		pesoCarga += unaCosa.peso()
			// butlos y consecuencias
		bultosCargados += unaCosa.bulto()
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
		pesoCarga -= unaCosa.peso()
			// bultos y consecuencias 
		bultosCargados -= unaCosa.bulto()
	}

	method todoPesoPar() {
		return cosas.all({ cosa => cosa.peso().even() })
	}

	method hayAlgunoQuePesa(peso) {
		return cosas.any({ cosa => cosa.peso() == peso })
	}

	method elDeNivel(nivel) {
		return cosas.find({ cosa => cosa.nivelPeligrosidad() == nivel })
	}

	method pesoTotal() = return pesoCarga + 1000

	method excedidoDePeso() = self.pesoTotal() > 2500

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method objetosMasPeligrososQue(cosaAComparar) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > cosaAComparar.nivelPeligrosidad() })
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and not cosas.filter({ self.objetosQueSuperanPeligrosidad(nivelMaximoPeligrosidad)}) > nivelMaximoPeligrosidad
	}

	method tieneAlgoQuePesaEntre(min, max) = cosas.filter({ cosa => cosa.peso().between(min, max) })

	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })

	method pesos() = cosas.map({ cosa => cosa.peso() })

// Parte 2 Bultos y Consecuencias
	method totalBultos() = bultosCargados

}

