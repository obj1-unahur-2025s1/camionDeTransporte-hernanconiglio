object knightRider {
    method peso() = 500
    method peligrosidad() = 10
    method bulto() = 1
    method consecuenciaDeCarga() {}
}

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformarse() {
        estado = estado.nuevoEstado()
    }
    method bulto() = 2
    method consecuenciaDeCarga() {estado = robot}
}

object auto {
    method peligrosidad() = 15
    method nuevoEstado() = robot
}

object robot {
    method peligrosidad() = 30
    method nuevoEstado() = auto
}
object ladrillos {
    var property cantidad = 0
    method peligrosidad() = 2
    method peso() = 2 * cantidad
//    method cantidad(unValor) {cantidad = unValor} //setter pero el property ya lo construye
//    method cantidad() = cantidad //getter pero el property ya lo construye
    method bulto() = if(cantidad<=100) 1
                     else if(cantidad.between(101,300)) 2
                     else 3
    method bultoSinIf() = (2.min(1.max(cantidad-99))).max(3.min(cantidad-298))
    method consecuenciaDeCarga() {cantidad += 12}
}

object arena {
    var property peso = 0
    method peligrosidad() = 1
    method bulto() = 1
    method consecuenciaDeCarga() {peso = (peso - 10).max(0)}
}

object bateriaAntiaerea {
    var tieneMisiles = false
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method peso() = if(tieneMisiles) 300 else 200
    method cargarMisiles() {tieneMisiles = true}
    method descargarMisiles() {tieneMisiles = false}
    method bulto() = if(tieneMisiles) 2 else 1
    method consecuenciaDeCarga() {self.cargarMisiles()}
}

object contenedor {
    const contenido = []
    method peso() = 100 + contenido.sum({c => c.peso()})
    method peligrosidad() = 
        if(contenido.isEmpty()) 0 else contenido.max({c => c.peligrosidad()}).peligrosidad()
    method agregarCosa(unaCosa) {contenido.add(unaCosa)}
    method quitarCosa(unaCosa) {contenido.remove(unaCosa)}
    method agregarListaDeCosas(unaLista) {contenido.addAll(unaLista)}
    method vaciarContenedor() {contenido.clear()}
    method bulto() = 1 + contenido.sum({c => c.bulto()})
    method consecuenciaDeCarga() {contenido.forEach({e=>e.consecuenciaDeCarga()})}
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200
    method bulto() = 1
    method consecuenciaDeCarga() {peso += 15}
}

object embalaje {
    var cosaEnvuelta = arena
    method envolver(unaCosa) {cosaEnvuelta = unaCosa}
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
    method bulto() = 2
    method consecuenciaDeCarga() {}
}