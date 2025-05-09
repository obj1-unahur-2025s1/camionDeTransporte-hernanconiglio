object camion {
    const carga = []

    method cargarCosa(unaCosa) {
        carga.add(unaCosa)
        unaCosa.consecuenciaDeCarga()
        }
    method descargarCosa(unaCosa) {carga.remove(unaCosa)}
    method cargarVariasCosas(listaDeCosas) {
        carga.addAll(listaDeCosas)
        listaDeCosas.forEach({c=>c.consecuenciaDeCarga()})
    } // nos fuimos al pasto y cargamos varias cosas, gentileza de Carla
    method pesoTotal() = 1000 + self.pesoCarga()
    method pesoCarga() = carga.sum({e => e.peso()})
    method todoPesoPar() = carga.all({e => e.peso().even()})
    method hayAlgoQuePesa(unValor) = carga.any({e => e.peso() == unValor}) 
    method cosaConPeligrosidad(unNivel) = carga.find({e => e.peligrosidad() == unNivel})
    method cosasSuperanPeligrosidad(unNivel) = carga.filter({c=>c.peligrosidad() > unNivel})
    method cosasMasPeligrosasQue(unaCosa) = self.cosasSuperanPeligrosidad(unaCosa.peligrosidad())
    method excedidoDePeso() = self.pesoTotal() > 2500
    method puedeCircular(unNivel) = 
        not self.excedidoDePeso() && self.cosasSuperanPeligrosidad(unNivel).isEmpty()
    method tieneAlgoQuePesaEntre(min,max) = carga.any({e=>e.peso().between(min, max)})
    method cosaMasPesada() = carga.max({e=>e.peso()})
}