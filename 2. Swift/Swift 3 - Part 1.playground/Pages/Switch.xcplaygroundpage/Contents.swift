/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Switch
 
 - Compara um valor com vários "matching patterns"
 - Cada case tem que ter pelo menos um comando executável
 - Ref: [The Swift Programming Language: Control Flow](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ControlFlow.html#//apple_ref/doc/uid/TP40014097-CH9-ID120)
 
 */
var respostaFundamental = 42

switch respostaFundamental {
case 1..<5:
    print("Intervalo de valores")
    
case 42:
    print("Valor exato")
    
case 56...60, 90, 100:
    print("Mais de um tipo de condição (Cases compostos)")
    
case let num where (num % 2 == 0):
    print("Use where para conferir condições adicionais")
    
default:
    print("Obrigatório caso os cases não atendam todos os casos possíveis")
}
//: Não possui `fallthrought` automático, ou seja, executa apenas o primeiro case correspondente
let meuNome = "Tiago"
let primeiraLetraDoNome: Character = meuNome.characters.first!

switch primeiraLetraDoNome {
case "M", "m":
    fallthrough
case "T", "t":
    print("Belo nome")

default:
    print("Não tão belo nome")
}
//: Podemos fazer match de tuplas
let ponto = (0,0)

switch ponto {
case (0,0):
    print("O ponto está na origem")
case (0,_):
    print("O ponto está no eixo x")
case (_,0):
    print("O ponto está no eixo y")
case (-2...2, -2...2):
    print("O ponto está na caixa")
case let (x,y):
    print("O ponto não está na caixa, ele está em (\(x),\(y))")
}
/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
