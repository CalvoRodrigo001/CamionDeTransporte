import cosas.*

object camion {

	const property cosas = []
	var pesoCarga = 0

	method cargar(unaCosa) {
		cosas.add(unaCosa)
		pesoCarga += unaCosa.peso()
	}

	method descargar(unaCosa) {
		cosas.remove(unaCosa)
		pesoCarga -= unaCosa.peso()
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

	method pesoTotal() = return pesoCarga + 100

	method excedidoDePeso() = self.pesoTotal() > 250

	method objetosQueSuperanPeligrosidad(nivel) {
		return cosas.filter({ cosa => cosa.nivelPeligrosidad() > nivel })
	}

	method objetosMasPeligrososQue(cosaAComparar) {
		return cos.filter({ cosa => cosa.nivelPeligrosidad() > cosaAComparar.nivelPeligrosidad() })
	}

	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return !self.excedidoDePeso() and not (cosas.any({ cosa => cosa.nivelPeligrosidad() > nivelMaximoPeligrosidad}))
	}

	method tieneAlgoQuePesaEntre(min, max) = cosas.filter({ cosa => cosa.peso().between(min, max) })

	method cosaMasPesada() = cosas.max({ cosa => cosa.peso() })

	method pesos() = cosas.map({ cosa => cosa.peso() })

}

