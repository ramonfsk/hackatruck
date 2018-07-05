/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Laços de repetição
 
 - Ref: [The Swift Programming Language: Control Flow](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)
 
 
 #### While e Repeat While
 
 - Repetem o bloco de código enquanto a condição for verdadeira
 */
var minhasMaçãs = 10

print("Tenho \(minhasMaçãs) 🍎!")

// While
while minhasMaçãs > 0 {
    minhasMaçãs -= 1
}

print("Agora tenho \(minhasMaçãs) 🍎")

// Repeat While
repeat {
    minhasMaçãs += 1
} while minhasMaçãs < 10

print("Tenho \(minhasMaçãs) 🍎 de novo!")
/*:
 #### For in
 */

for numero in 1...7 {
    print(numero)
}

for numero in 1..<8 {
    print(numero)
}

//: Iterando ao contrário
print("Reversed:")
for numero in (1...7).reversed() {
    print(numero)
}

//: Modificando o passo
print("To:")
for numero in stride(from: 0, to: 10, by: 2) {
    print(numero)
}

print("Through:")
for numero in stride(from: 0, through: 10, by: 2) {
    print(numero)
}
/*:
 - Experiment: ?
 */

/*:
 - callout(Exercicio): ?
 */

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
