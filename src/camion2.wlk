import cosas2.*

object camion {
	const cargaDeCamion = []
	method tieneCargado(unaCosa) {
		return cargaDeCamion.contains(unaCosa)
	}
	method cantidadDeCosasCargadas() {
		return cargaDeCamion.size()
	}
	method cargar(unaCosa) {
		cargaDeCamion.add(unaCosa)
	}
	method descargar(unaCosa) {
		cargaDeCamion.remove(unaCosa)
	}
	method hayAlgunoQuePesa(peso) {
		return cargaDeCamion.any({cosa => cosa.peso() == peso})
	}
	method elDeNivel(nivel) {
		return cargaDeCamion.find({cosa => cosa.nivelDePeligrosidad() == nivel})
	}
	method pesoTotal() {
		return cargaDeCamion.sum({cosa => cosa.peso()})
	}
	method excedidoDePeso() {
		return self.pesoTotal() > 2500
	}
	method objetosQueSuperanPeligrosidad(nivel) {
		return cargaDeCamion.filter({cosa => cosa.nivelDePeligrosidad() > nivel})
	}
	method objetosMasPeligrososQue(cosa) {
		return self.objetosQueSuperanPeligrosidad(cosa.nivelDePeligrosidad())
	}
	method puedeCircularEnRuta(nivelMaximoPeligrosidad) {
		return not self.excedidoDePeso() and self.cosaMasPeligrosa().nivelDePeligrosidad() <= nivelMaximoPeligrosidad //cargaDeCamion.all({cosa => cosa.nivelDePeligrosidad() <= nivelMaximoPeligrosidad})
	}
	method cosaMasPeligrosa() {
		return cargaDeCamion.max({cosa => cosa.nivelDePeligrosidad()})
	}
	method tieneAlgoQuePesaEntre(min,max) {
		return cargaDeCamion.any({cosa => cosa.peso() <= max and cosa.peso() >= min})
	}
	method cosaMasPesada() {
		return cargaDeCamion.max({cosa => cosa.peso()})
	}
	method pesos() {
		return cargaDeCamion.map({cosa => cosa.peso()})
	}
	method totalBultos() {
		return cargaDeCamion.sum({cosa => cosa.bulto()})
	}
}