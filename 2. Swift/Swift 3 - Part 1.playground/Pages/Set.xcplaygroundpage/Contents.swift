/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Set
 
 - São conjuntos de elementos distintos do mesmo tipo
 - São armazenados de forma não ordenada
 - Ref: [Collection Types: Set](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID484)
 - Ref: [Set - Swift Standard Library | Apple Developer Documentation](https://developer.apple.com/reference/swift/set)
 - Ref: [Sets - Swift 2.2](http://www.codingexplorer.com/swift-set-type/)
 */
//: #### Criando um Set
// Criando novos arrays vazios
var novoArrayDeInteiros = Set<Int>()
var novoArrayDeStrings = Set<String>()

var strings = Set<String>()
var numerosReais = Set<Double>()
var numerosReaisDeNovo: Set<Double> = []

// Inicializando com valores
let animais: Set = ["Gato", "Galinha"]
var pares: Set<Int> = [2, 4, 6, 8, 10]
var impares: Set = [1, 3, 5, 7, 9]
//: #### Acessando e modificando um Set
// Quantidade de elementos
pares.count
// Conferindo se está vazio
pares.isEmpty
// Conferindo se um elemento está dentro do Set
pares.contains(3)
// Adicionando elementos novos
pares.insert(12)
//: #### Remover
var numeroRemovido = pares.remove(12)

impares.removeFirst()
impares.removeAll()
//: #### Iterar
for animal in animais {
    print(animal)
}

for numero in pares.sorted() {
    print(numero)
}
/*:
 - Experiment: [Operações de conjuntos](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105)
 */
let numerosImpares: Set = [1, 3, 5, 7, 9]
let numerosPares: Set = [0, 2, 4, 6, 8]
let numerosPrimosDeUmDigito: Set = [2, 3, 5, 7]

// União de conjuntos
numerosImpares.union(numerosPares).sorted()

// Intersecção de conjuntos
numerosImpares.intersection(numerosPares).sorted()

// Subtração de conjuntos
numerosImpares.subtracting(numerosPrimosDeUmDigito).sorted()

// Remove a intersecção entre os conjuntos
numerosImpares.symmetricDifference(numerosPrimosDeUmDigito).sorted()
/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
