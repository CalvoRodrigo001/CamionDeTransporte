import camion.*

object knightRider {

	method peso() {
		return 500
	}

	method nivelPeligrosidad() {
		return 10
	}

	// parte 2 bultos y consecuencias 
	method bulto() = 1

}

object bumblebee {

	var transformadoEnAuto = true

	method peso() {
		return 800
	}

	method nivelPeligrosidad() {
		return if (transformadoEnAuto) {
			15
		} else {
			30
		}
	}

	method transformar() {
		transformadoEnAuto = not transformadoEnAuto
	}

	// parte 2 bultos y consecuencias 
	method bulto() = 2

}

object paqueteDeLadrillos {

	var cantidadDeLadrillos = 0

	method agregarLadrillos(cantidad) {
		cantidadDeLadrillos += cantidad
	}

	method peso() = cantidadDeLadrillos * 2

	method nivelPeligrosidad() = 2

	// parte 2 bultos y consecuencias 
	method bulto() = if (cantidadDeLadrillos.between(101, 300)) {
		2
	} else if (cantidadDeLadrillos >= 301) {
		3
	} else {
		1
	}

}

object arenaAGranel {

	var peso

	method asignarPeso(nuevoPeso) {
		peso = nuevoPeso
	}

	method peso() = peso

	method nivelPeligrosidad() = 1

	// parte 2 bultos y consecuencias 
	method bulto() = 1

}

object bateriaAntiAerea {

	var tieneMisilesCargados = false

	method cargarMisiles() {
		tieneMisilesCargados = true
	}

	method descargarMisiles() {
		tieneMisilesCargados = false
	}

	method peso() = if (tieneMisilesCargados) {
		300
	} else {
		200
	}

	method nivelPeligrosidad() = if (tieneMisilesCargados) {
		100
	} else {
		0
	}

	// parte 2 bultos y consecuencias 
	method bulto() = if (tieneMisilesCargados) 2 else 1

}

object contenedorPortuario {

	const property contenido = []

	method meterCosa(cosa) {
		contenido.add(cosa)
	}

	method sacarCosa(cosa) {
		contenido.remove(cosa)
	}

	method peso() = contenido.sum({ cosa => cosa.peso() }) + 100

	method nivelPeligrosidad() = if (contenido.isEmpty()) 0 else contenido.max({ cosa => cosa.nivelPeligrosidad() }).nivelPeligrosidad()

	// parte 2 bultos y consecuencias 
	method bulto() = 1 + contenido.sum({ cosa => cosa.bulto() })

}

object residuosRadioactivos {

	var peso

	method asignarPeso(nuevoPeso) {
		peso = nuevoPeso
	}

	method peso() = peso

	method nivelPeligrosidad() = 200

	// parte 2 bultos y consecuencias 
	method bulto() = 1

}

object embalajeDeSeguridad {

	var contenido

	method embalar(cosa) {
		contenido = cosa
	}

	method peso() = contenido.peso()

	method nivelPeligrosidad() = contenido.nivelPeligrosidad() / 2

	// parte 2 bultos y consecuencias 
	method bulto() = 2

}

