/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****

 # Operadores
 
 - Ref: [Swift Standard Library Operators](https://developer.apple.com/reference/swift/swift_standard_library_operators)
 
 */
//: #### Operadores Aritméticos
let soma          = 2 + 2

let subtração     = 10 - 7

let divisão       = 30 / 2

let multiplicação = 2 * 100

let restoInteiro  = 81 % 4

let restoDecimal  = 85.3.remainder(dividingBy: 4)
/*:
 - Note: Só podemos realizar operações entre elementos do mesmo tipo!
 */
//: #### Operador de Associação Composta
var 🍎 = 0

// Ganhei 5 maçãs 😎
🍎 += 5
// Mas 3 estavam podres 😑
🍎 -= 3

print("Total de maçãs: \(🍎)")

//: #### Operadores de Comparação
let idade = 18

let igualdade       = (idade == 18)
let diferença       = (idade != 20)

let maiorQue        = (idade >  18)
let maiorOuIgualQue = (idade >= 18)

let menorQue        = (idade <  18)
let menorOuIgualQue = (idade <= 18)

//: #### Operadores Lógicos
// AND
if (idade > 16) && (idade < 21) {
    print("Pode dirigir nos EUA, mas beber não pode não")
}
// OR
if (idade < 18) || (idade > 65 ) {
    print("Talvez você não deveria estar dirigindo por ai...")
}
/*: 
 #### Operador Ternário

 `question` ? `answer 1` : `answer 2`
*/
let possoDirigir = (idade >= 18) ? "Sim! Você pode!" : "Não, não pode não"
/*:
 - Experiment: Utilize as funções `pow` e `sqrt` para realizar as contas abaixo
 */
import Foundation

let doisElevadoAOitava: Double = 2 * 2 * 2 * 2 * 2 * 2 * 2 * 2

let raizQuadradadaDeOitentaEUm: Double = 9
/*:
 ****
 [Previous](@previous) | [Next](@next)
 ****
*/
/*:
 - callout(Extra): Sobrescrita de operador
 
 Ref: [Operator Overloading in Swift Tutorial](https://www.raywenderlich.com/80818/operator-overloading-in-swift-tutorial)
 */
func +(left: [Int], right: [Int]) -> [Int] {
    // resultado da soma
    var soma = [Int]()
    // confere se os arrays tem o mesmo tamanho
    assert(left.count == right.count, "Apenas somamos vetores com mesmo tamanho")
    // soma os elementos dos arrays
    for (indice, _) in right.enumerated() {
        soma.append(left[indice] + right[indice])
    }
    // retorna o array com os resultados
    return soma
}

var somaDeArrays = [1,2,3] + [4,5,6]
