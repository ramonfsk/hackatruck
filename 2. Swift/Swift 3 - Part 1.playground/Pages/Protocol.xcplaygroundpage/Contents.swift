/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Protocol
 
 - Define um conjunto de métodos e propriedades requeridos para alguma tarefa em particular
 - Uma classe que adota um `protocol` deve implementar os métodos e propriedades que ele define
 - Ref: [The Swift Programming Language: Protocols](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Protocols.html#//apple_ref/doc/uid/TP40014097-CH25-ID267)
 
 #### Definindo um protocolo
 */
protocol Ave {
    // Definindo propriedades
    var penas: Int { get set }
    
    // Definindo métodos
    func botarOvo()
    func emitir(som: String) -> String
}

class Galinha: Ave {
    var penas: Int = 600
    
    func botarOvo() {
        print("A galinha botou um ovo!")
    }
    
    func emitir(som: String) -> String {
        return "A galinha carcarejou: \(som)"
    }
}
/*:
 - Note: Protocolos podem ser extendidos
 */
import GameplayKit

extension Ave {
    func procurarComida() -> Int {
        let random = GKRandomDistribution(lowestValue: 0, highestValue: 10)
        
        return random.nextInt()
    }
}
/*:
 - Experiment: Vamos testar o que aprendemos até aqui. Modifique as classes abaixo de forma que elas implementem o protocolo do combustível correspondente.
 */

protocol Gasolina {
    var quantidadeDeCombustível: Int { get set }
    
    func ativarVela()
    func injetarCombustívelComAr()
}

protocol Diesel {
    var quantidadeDeCombustível: Int { get set }
    
    func injetarArAquecido()
    func injetarCombustívelSobPressão()
}

class MotorDeCarro {
    
}

class MotorDeCaminhão {
    
}
/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
