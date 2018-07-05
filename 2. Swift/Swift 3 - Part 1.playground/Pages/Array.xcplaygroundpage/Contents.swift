/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Arrays
 
 - Listas de elementos do mesmo tipo
 - Caso `var`, podemos adicionar e remover elementos
 - Ref: [The Swift Programming Language (Swift 3.0.1): Collection Types](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105)
 - Ref: [We ❤︎ Swift: Array](https://www.weheartswift.com/arrays/)
 */
//: #### Criando um array
// Criando novos arrays vazios
var novoArrayDeInteiros = Array<Int>()
var novoArrayDeStrings = Array<String>()

var strings = [String]()
var numerosReais = [Double]()

// Inicializando com valores
let animais = ["Gato", "Galinha"]
let pares = [2, 4, 6, 8, 10]
let impares = [1, 3, 5, 7, 9]

// Repetindo um elemento
let distâncias: [Double] = Array(repeating: 0.0, count: 5)

// Somando arrays
let numeros: [Int] = pares + impares
//: #### Acessando os elementos no array
var animaisDaFazenda = ["🐮", "🐷", "🐴", "🐔"]

let quantidadeDeAnimais: Int = animais.count
let nenhumAnimal: Bool       = animais.isEmpty

let frase = "O primeiro animal é o \(animaisDaFazenda.first!) ou \(animaisDaFazenda[0])"
// Modificando um elemento
animaisDaFazenda[3] = "🐓"

//: #### Adicionar um elemento
animaisDaFazenda.append("🐥")
animaisDaFazenda.append("🐮")

animaisDaFazenda += ["🐶"]
//: #### Remover elementos do Array

animaisDaFazenda.remove(at: 0)

//: #### Iterando pelo Array

for animal in animaisDaFazenda {
    print("Na minha fazenda tenho um \(animal)")
}

for (indice, animal) in animaisDaFazenda.enumerated() {
    print("Na minha fazenda tenho um \(animal) na posição \(indice)")
}

/*:
 - Experiment: No array abaixo tente descobrir:
 
 - Qual o nome da franquia mais nova?
 - Em que ano a franquia mais antiga foi lançada?
 - Quais franquias foram criadas após 1999?
 - Quantas franquias foram criadas antes do ano 2000?

 */

var franquias = [
    (nome: "Jurassic Park", ano: 1993),
    (nome: "Matrix", ano: 1999),
    (nome: "Senhor dos Anéis", ano: 2001),
    (nome: "Star Wars", ano: 1977),
    (nome: "Indiana Jones", ano: 1981),
    (nome: "Vingadores", ano: 2012)
]

// Qual o nome da franquia mais nova?
var franquiaMaisNova: (nome: String, ano: Int) = ("", 0)

for franquia in franquias {
    if franquia.ano > franquiaMaisNova.ano {
        franquiaMaisNova = franquia
    }
}

print("A franquia mais nova se chama \(franquiaMaisNova.nome)")

// Em que ano a franquia mais antiga foi lançada?
var ano = 9999

for franquia in franquias {
    if franquia.ano < ano {
        ano = franquia.ano
    }
}

print("A franquia mais antiga foi lançada em \(ano)")

// Quais franquias foram criadas após 1999?
let franquiasPos1999 = franquias
                        .filter { $0.ano > 1999 }
                        .map { $0.nome }
                        .joined(separator: ", ")

print("Franquias pós 1999: \(franquiasPos1999)")

// Quantas franquias foram criadas antes do ano 2000?
let quantidadeDeFranquiasAntesDe2000 = franquias.filter { $0.ano < 2000 }.count

print("\(quantidadeDeFranquiasAntesDe2000) foram criadas antes de 2000")

/*:
 - callout(Exercicio): No array de nomes abaixo:
 
 1. Adicione um novo nome no array
 
 2. Descubra a posição do nome Lucas
 
 3. Remova o nome Lucas
 
 4. Ordene o array em ordem alfabética
 */
var nomes = ["Douglas", "Marilia", "Roberto", "Carol", "Lucas", "Iasmim", "João", "Zeca"]
// 1. Adicione um novo nome no array

// 2. Descubra a posição do nome Lucas

// 3. Remova o nome Lucas

// 4. Ordene o array em ordem alfabética

/*:
 ****
 [Previous](@previous) | [Next](@next)
 ****
 */
/*:
 - callout(Extra): High order functions
 
 Ref: [Higher Order Functions: Map, Filter, Reduce and more](https://www.weheartswift.com/higher-order-functions-map-filter-reduce-and-more/)
 
 Ref: [High-order Function](https://en.wikipedia.org/wiki/Higher-order_function)
 
 Ref: [First-class function](https://en.wikipedia.org/wiki/First-class_function)
 */
let numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]

// filter:
//  Filtra o array
let apenasImpares = numbers.filter { $0 % 2 == 1 }

print("Impares: \(apenasImpares)")

// map:
//  Aplica uma transforamação em todos os elementos do array
let tudoDobrado = numbers.map { $0 * 2 }

print("Tudo dobrado: \(tudoDobrado)")

// reduce: 
//  Reduz o array a 1 valor
let somaDeTudo = numbers.reduce(0) { $0 + $1 }

print("Soma dos valores: \(somaDeTudo)")
