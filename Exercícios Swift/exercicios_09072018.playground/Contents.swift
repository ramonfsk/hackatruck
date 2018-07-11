import UIKit

class Inimigo{
    var tipo: String?
    var level: Int?
    private var dano: Double?
    private var vida: Double?
    
    init(tipo: String, level: Int, dano: Double, vida: Double){
        self.tipo = tipo
        self.level = level
        self.dano = dano
        self.vida = vida
    }
    
    public func atacar(){
        print("O inimigo do atacou!")
    }
    
    public func morrer(tipo: String){
        if(vida == 0){
            print("O inimigo \(tipo) morreu!")
        }
    }
}

class Voador: Inimigo{
    
    override func atacar(tipo: String, level: Int){
        print("O inimigo do tipo \(self.tipo), de nível \(self.level) atacou!")
    }
    
}

class Terrestre: Inimigo{
}

let inimigoVoador = Voador()
inimigoVoador.atacar(tipo: "Voador", level: 10)