
class Criatura {
    var property poderMagico

    var property astucia

    //var property rol
}


class Duende inherits Criatura(poderMagico = 0,astucia = 0) {

    const property tieneCuernos = true

}

class Hada inherits Criatura(poderMagico = 0,astucia = 0) {

    const property tieneCuernos = false

    var property kilometrosDeVuelo = 2

    method aumentarKilometrosDeVuelo() { //     1  ,   24
        if( self.kilometrosDeVuelo().between( 0 + 1, 25 - 1 ) ){
            kilometrosDeVuelo = kilometrosDeVuelo + 1
        }
    }



    method poderOfensivo() = self.poderMagico() * 10

}

//roles

class rol {

    var property criatura

    method cambiarCriatura(nuevaCriatura){
        criatura = nuevaCriatura
    }

    method poderOfensivo() = self.criatura().poderMagico() * 10


}

class Guardian inherits rol(criatura = new Hada()){
    override method poderOfensivo() = super() + 100

}

class Hechicero inherits rol(criatura = new Duende()){
    override method poderOfensivo() = super()
}

class Domador inherits rol(criatura = new Hada()){

    var property mascotas = []

    method agregarMascota(unaMascota){
        mascotas.add(unaMascota)
    }

    override method poderOfensivo(){
        return
            super() + 
            (150 * mascotas.filter({unaMascota => not unaMascota.tieneCuernos() }).size())
    }

    
}

/*
const domador_1 = new Domador()
 
const hechicero_1 = new Hechicero()
 
const guardian_1 = new Guardian()
*/

