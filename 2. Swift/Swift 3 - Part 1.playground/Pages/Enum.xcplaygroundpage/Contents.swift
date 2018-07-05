/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Enumeração
 
 - Define um tipo comum para um grupo de valores relacionados.
 - Ref: [The Swift Programming Language (Swift 3.0.1): Enumerations](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Enumerations.html#//apple_ref/doc/uid/TP40014097-CH12-ID145)
 */
enum PontoCardial {
    case norte
    case sul
    case leste
    case oeste
}

enum Planeta {
    case mercurio, terra, venus, marte, jupiter, saturno
}
//: Ele pode representar um valor também
enum Status: Int {
    case ativo = 0
    case inativo = 1
    case bloqueado = 2
}

let status: Status = .ativo

status.rawValue
//: Usando um enum
let direcao = PontoCardial.norte

switch direcao {
case .norte:
    print("Você ira encontrar o Papai Noel.")
case .sul:
    print("Dizem ter apenas gelo por lá.")
case .leste:
    print("Indo de encontro ao Sol.")
case .oeste:
    print("Boa viagem, cowboy.")
}
//: Podemos associar valores nos nosso enumeradores

enum Produto {
    case liquido(volume: Int)
    case solido(peso: Int)
}

func confere(produto: Produto) {
    switch produto {
    case .liquido(let volume):
        print("Seu produto possui \(volume) ml's")
    case .solido(let peso):
        print("Seu produto possui \(peso) gramas")
    }
}

let refrigerante: Produto = .liquido(volume: 500)
let chocolate: Produto = .solido(peso: 350)

confere(produto: refrigerante)
confere(produto: chocolate)

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
