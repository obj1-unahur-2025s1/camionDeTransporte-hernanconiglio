object knightRider {
    method peso() = 500
    method peligrosidad() = 10
}

object bumblebee {
    var estado = auto
    method peso() = 800
    method peligrosidad() = estado.peligrosidad()
    method transformarse() {
        estado = estado.nuevoEstado()
    }
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
}

object arena {
    var property peso = 0
    method peligrosidad() = 1
}

object bateriaAntiaerea {
    var tieneMisiles = false
    method peligrosidad() = if(tieneMisiles) 100 else 0
    method peso() = if(tieneMisiles) 300 else 200
    method cargarMisiles() {tieneMisiles = true}
    method descargarMisiles() {tieneMisiles = false}
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
}

object residuos {
    var property peso = 0
    method peligrosidad() = 200
}

object embalaje {
    var cosaEnvuelta = arena
    method envolver(unaCosa) {cosaEnvuelta = unaCosa}
    method peso() = cosaEnvuelta.peso()
    method peligrosidad() = cosaEnvuelta.peligrosidad() * 0.5
}