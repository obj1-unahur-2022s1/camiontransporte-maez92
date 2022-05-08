object knightRider {
	method peso() {return 500}
	method nivelDePeligrosidad() {return 10}
	method bulto() {return 1}
	method consecuenciaDeLaCarga() {}
}

object bumblebee {
	var estaTransformadoEnRobot = false
	method peso() {return 800}
	method nivelDePeligrosidad() {
		if (estaTransformadoEnRobot) {
			return 30
		}
		else {
			return 15
		}
	}
	method transformarEnRobot() {estaTransformadoEnRobot = true}
	method transformarEnAuto() {estaTransformadoEnRobot = false}
	method estaTransformadoEnRobot() {return estaTransformadoEnRobot}
	method bulto() {return 2}
	method consecuenciaDeLaCarga() {self.transformarEnRobot()}
}

object paqueteLadrillos {
	var cantidadDeLadrillos
	method setCantidad(cantidad) {cantidadDeLadrillos = cantidad}
	method cantidad() {return cantidadDeLadrillos}
	method peso() {return cantidadDeLadrillos * 2}
	method nivelDePeligrosidad() {return 2}
	method bulto() {
		if (cantidadDeLadrillos <= 100) {
			return 1
		}
		else if (cantidadDeLadrillos >= 101 and cantidadDeLadrillos <= 300) {
			return 2
		}
		else {
			return 3
		}
	}
	method consecuenciaDeLaCarga() {cantidadDeLadrillos += 12}
}

object arena {
	var pesoArenaAGranel = 300
	method setPeso(peso) {pesoArenaAGranel = peso}
	method peso() {return pesoArenaAGranel}
	method nivelDePeligrosidad() {return 1}
	method bulto() {return 1}
	method consecuenciaDeLaCarga() {pesoArenaAGranel += 20}
}

object bateriaAntiaerea {
	var tieneMisiles = false
	method cargar() {tieneMisiles = true}
	method peso() {
		if (tieneMisiles) {
			return 300
		}
		else {
			return 200
		}
	}
	method nivelDePeligrosidad() {
		if (tieneMisiles) {
			return 100
		}
		else {
			return 0
		}
	}
	method estaCargada() {return tieneMisiles}
	method bulto() {
		if (tieneMisiles) {
			return 1
		}
		else {
			return 2
		}
	}
	method consecuenciaDeLaCarga() {self.cargar()}
}

object contenedor {
	const cosasInternas = []
	method guardar(unaCosa) {cosasInternas.add(unaCosa)}
	method peso() {return 100 + cosasInternas.sum({cosa => cosa.peso()})}
	method nivelDePeligrosidad() {return cosasInternas.max({cosa => cosa.nivelDePeligrosidad()})}
	method cantidadDeCosasGuardadas() {return cosasInternas.size()}
	method tieneGuardado(unaCosa) {	return cosasInternas.contains(unaCosa)}
	method bulto() {
		return 1 + cosasInternas.sum({cosa => cosa.bulto()})
	}
	method consecuenciaDeLaCarga() {cosasInternas.forEach({cosa => cosa.consecuenciaDeLaCarga()})}
}

object residuosRadioactivos {
	var peso
	method setPeso(nuevoPeso) {peso = nuevoPeso}
	method peso() {return peso}
	method nivelDePeligrosidad() {return 200}
	method bulto() {return 1}
	method consecuenciaDeLaCarga() {peso += 15}
}

object embalajeSeguridad {
	var cosaInterna
	method embalar(unaCosa) {cosaInterna = unaCosa}
	method peso() {return cosaInterna.peso()}
	method nivelDePeligrosidad() {return cosaInterna.nivelDePeligrosidad() / 2}
	method cosaEmbalada() {return cosaInterna}
	method bulto() {return 2}
	method consecuenciaDeLaCarga() {}
}