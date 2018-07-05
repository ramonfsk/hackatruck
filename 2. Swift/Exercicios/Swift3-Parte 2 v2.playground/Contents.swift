
import UIKit

/*:
 Optional
 
 Optionals são a maneira através da qual Swift trabalha com tratamento de valores nulos
 
 - ! : indica que o objeto em questão não está nulo
 - ? : indica que o objeto pode ser nulo
 */
class Musica {
    // A musica tem que ter um nome
    var nome: String
    // Porém, não precisa ter uma nota
    var nota: Int?
    
    init(nome: String, nota: Int?) {
        self.nome = nome
        self.nota = nota
    }
}

// Criamos uma musica sem nota
var minhaMusica: Musica = Musica(nome: "Breezeblocks", nota: nil)

// Temos a musica, mas não temos a nota
print(minhaMusica.nome)
print(minhaMusica.nota)

// Vamos dar uma nota para a música
minhaMusica.nota = 10
// Para acessarmos o valor do optional usamos o operador '!'
print("Sem '!': \(minhaMusica.nota) \n Com '!': \(minhaMusica.nota!)")

/*:
 Optional Binding
 
 É uma maneira de testar se o objeto está nulo, de maneira segura
 */
// Lembra da musica ali em cima?
// Se ela tiver uma nota, vamos imprimir essa nota
if let nota = minhaMusica.nota {
    print("A nota da musica é: \(nota)")
} else {
    // Se ela não tivesse nota, ou seja, o valor de musica.nota fosse nil
    // Entrariamos no else
    print("A musica não possui nota")
}

/*:
 Nil coalescing operator
 
 Operador que desempacota um Optional se ele não estiber nulo ou retorna o segundo valor
 */
let eventoManha: String? = "Palestra interessante"

var meuEvento = eventoManha ?? "Lanchar"

/*:
 Lazy
 
 Propriedades armazenadas como "lazy" não tem seu valor calculado até a primeira vez que são chamadas.
 
 Elas são úteis quando o valor inicial da propriedade depende de outros itens da classe, cujos valores ainda são desconhecidos até que sua inicialização esteja completa.
 
 Também são úteis quando o valor da propriedade é muito complexo, e não deve ser preenchido até que seja necessário
 */
class Retangulo {
    let base: Int
    let altura: Int
    // Só vamos calcular a area depois que o objeto for inicializado
    // Assim teremos os valores da base e da altura necessários
    lazy var area: Int = self.base * self.altura
    
    init(base: Int, altura: Int){
        self.base = base
        self.altura = altura
    }
}

let quadrado = Retangulo(base: 10, altura: 10)
print("Area do quadrado: \(quadrado.area)")

/*:
 Operadores is/as
 */
class Animal {
    var nome: String?
    
    init(nome: String) {
        self.nome = nome
    }
}

class Cão: Animal { }

class Raposa: Animal { }

let cão: Animal = Cão(nome: "Toby")
let raposa: Animal = Raposa(nome: "Dodó")


// - IS: Operador de comparação. Verifica se um objeto é de um determinado tipo.

let animal = raposa

if animal is Raposa {
    print("\(animal.nome!): Você é meu melhor amigo")
} else {
    print("\(animal.nome!): E você também é o meu, Dodó")
}

// - AS: Operador de conversão. Converte o objeto para o tipo informado.

if let _ = animal as? Raposa {
    print("Temos uma raposa aqui!")
} else {
    print("Não vejo nenhuma raposa...")
}

/*:
 Closures
 
 São as funções "inline", também conhecidas como blocks.
 
 Permitem estabelecer paralelismo dentro do código.
 */
let names = ["Python", "Ruby", "Swift", "PHP", "Java"]

// Exemplo de uma função para ordenar alguns nomes em ordem decrescente
func comparador(s1: String, s2: String) -> Bool {
    return s1 > s2
}

// Para ordenarmos um array precisamos saber qual a regra a ser utilizada
// Por isso precisamos passar uma função que define essa regra
var reversed = names.sorted(by: comparador)

// Mesma função, utilizando closures
reversed = names.sorted(by: { (s1: String, s2: String) -> Bool in
    return s1 > s2
})

// Sintaxe simplificada
reversed = names.sorted { $0 > $1 }

/*:
 Extensões
 
 - Permitem adicionar recursos a determinadas classes, sem modificar a classe original.
 - É diferente de Herança.
 */
// Vamos adicionar umas funcionalidades na classe String
extension String {
    // Uma função que retorna um array com todas as letras da string
    func getChars() -> [String] {
        let characters = Array(self.characters).map {
            String($0)
        }
        
        return characters
    }
    
    // Uma funcao que retorna a string sem nenhuma vogal
    func nonVogals() -> String {
        var result: String = String()
        
        for letter in Array(self.lowercased().getChars()) {
            switch(letter) {
            case "a", "e", "i", "o", "u":
                continue
            default:
                result += String(letter)
            }
        }
        return result
    }
}

// Nossa string que sera testada
let srt = "Oi! Tudo bem?"

srt.getChars() // Todas as letras da string
srt.nonVogals() // Sem as vogais
