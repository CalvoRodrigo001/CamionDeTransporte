import camion.*

object knightRider {
	method peso() { return 500 }
	method nivelPeligrosidad() { return 10 }
}

object bumblebee {
	var transformadoEnAuto = true
	
	method peso() { return 800 }
	method nivelPeligrosidad() { return if (transformadoEnAuto) { 15 } else { 30 }  }
	method transformar() { transformadoEnAuto = not transformadoEnAuto }
}

object paqueteDeLadrillos{
	var cantidadDeLadrillos = 0
	
	method agregarLadrillos(cantidad){cantidadDeLadrillos += cantidad }
	method peso()= cantidadDeLadrillos * 2
	method nivelPeligrosidad()=2
}
 object arenaAGranel{
 	var peso 
 	method asignarPeso(nuevoPeso){peso = nuevoPeso}
 	method peso()= peso
 	method nivelPeligrosidad()= 1
 }
object bateriaAntiAerea{
	var tieneMisilesCargados = false
	
	method cargarMisiles(){tieneMisilesCargados = true}
	method descargarMisiles(){tieneMisilesCargados = false}
	method peso()=if(tieneMisilesCargados){300} else{200}
	method nivelPeligrosidad()=if(tieneMisilesCargados){100} else{0}
}

object contenedorPortuario{
	const property contenido = []
	
	method meterCosa(cosa){contenido.add(cosa)}
	method sacarCosa(cosa){contenido.remove(cosa)}
	method peso()= contenido.sum({cosa => cosa.peso()}) + 100
	method nivelPeligrosidad()= if(contenido.isEmpty()) 0 else contenido.max({cosa => cosa.nivelPeligrosidad()}).nivelPeligrosidad()
}

object residuosRadioactivos{
	var peso 
	
 	method asignarPeso(nuevoPeso){peso = nuevoPeso}
 	method peso()= peso
 	method nivelPeligrosidad()= 200
}
object embalajeDeSeguridad{
	var contenido
	
	method embalar(cosa){contenido = cosa}
	method peso()=contenido.peso()
	method nivelPeligrosidad()=contenido.nivelPeligrosidad()/2
}