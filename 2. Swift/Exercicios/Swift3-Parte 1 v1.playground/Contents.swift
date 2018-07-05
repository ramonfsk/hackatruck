
import UIKit

/*:
 Variáveis e Constantes
 
 - var: permite que o valor seja modificado
 - let: não permite alterações, cria uma constante
*/
// Strings
var greeting = "Olá, bem vindo ao playground!"
let mensagem: String = "Olá novamente!"

// Inteiros
let idade = 24
let maiorIdade: Int = 18

// Float e Double
let sempreDouble = 10.0

let GRAVIDADE_TERRA: Float = 9.78
let PI: Double = 3.141592

// Bool
var isOpen = false
var isClosed = !isOpen

// Interpolando valores
let nome = "Tiago"
var stringComValores = "Meu nome é \(nome) e minha idade é \(idade)"

// Convertendo valores
let inteiroParaString: String = String(10)
let doubleParaString: String = String(5.76)


/*:
 - callout(Exercicio): Converta os valores para o tipo correspondente
 */
/*
 
let inteiro: Int = 10
let double: Double = 5.72
let string: String = "73"

// Conversão direta
let doubleFromInt: Double = inteiro

let intFromDouble: Int = double

let stringFromInt: String = inteiro
let stringFromDouble: String = double


// Conversão condicional
let intFromString: Int = string
let doubleFromString: Double = string
 
*/
/*:
 Operadores
 */
var num1: Float = 7.7
var num2: Float = 48.0

/*:
 - Aritméticos
 */
num1 + num2     // Soma
num1 - num2     // Subtração
num1 / num2     // Divisão
num1 * num2     // Multiplicação

// Resto da divisão (módulo) para números inteiros
Int(num1) % Int(num2)

// Resto da divisão (módulo) para números de ponto flutuante
num2.truncatingRemainder(dividingBy: num1)

/*:
 - Lógicos
 */
num1 == num2    // Igual
num1 != num2    // Diferente

num1 > num2     // Maior que
num1 >= num2    // Maior ou igual à

num1 < num2     // Menor que
num1 <= num2    // Menor ou igual à

// Operador AND
var positiveSmallerThan100 = (num1 > 0) && (num1 < 100)

// Operador OR
var gender = "F"
var validGender = (gender.lowercased() == "f") || (gender.lowercased() == "m")

/*:
 - callout(Exercicio): Implemente de forma que as respostas fiquem corretas
 */
/*
 
var resposta: Int

// 1. Quanto é 2 elevado a 8?
resposta = // utilize a função pow

if resposta == 256 {
    print("Resposta correta!")
}

// 2. Qual a raiz quadrada de 196?
resposta = // utilize a função sqrt

if resposta == 14 {
    print("Resposta correta!")
}
 
*/

/*: 
 Tuplas
 
 Consistem em listas simples, não tipadas
 */
let bandas = ("Beatles", "Queen", "The Clash", "The Cure", "Rolling Stones")
print("Era um garoto que como eu, amava os \(bandas.0) e os \(bandas.4)")

var filme = (nome: "Jurassic Park", ano: 1993, director: "Steven Spielbert", IMDB: 8.1)
print("\(filme.nome) estreou em \(filme.1)")

/*:
 - callout(Exercicio): Utilize a tupla para completar a frase
 */

let periodoGeológico = (periodo: "Cretácio", era: "Mesozoica", inicio: 145, fim: 66)
/*
 
let frase = "Na escala de tempo geológico, o \() " +
            "ou Cretácico é o período da era \() " +
            "que está compreendido entre \() milhões" +
            " e \() milhões de anos atrás, aproximadamente."

*/
/*:
 Arrays

 Um lista de elementos do mesmo tipo
 */
// Array de Doubles
// - PI, Napier, Áureo
var constantesMatematicas: [Double] = [3.141592, 2.718281, 1.611803]

// Adicionando um elemento ao array
let numeroDeEuler = 0.577215

constantesMatematicas.append(numeroDeEuler)

// Iterando pelos elementos de um array
for constante in constantesMatematicas {
    print("Constante matematica: \(constante)")
}

// Iterando pelos elementos de um array com indice
for (indice, valor) in constantesMatematicas.enumerated() {
    print("Posição \(indice): constante matematica: \(valor)")
}

// Array contendo elementos de tipos diferentes
var array: [Any] = [1, true, "Swift"]

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
 Dicionários

 Estrutura composta sempre por duas informações: chave e valor
 */
// Criamos um novo dicionário com chave Int e valores String
var albunsDoEngenheirosDoHawaii: [Int: String] = [
    1990: "O Papa é Pop",
    1986: "Longe Demais das Capitais",
    1995: "Simples de Coração",
    1999: "Tchau Radar!"
]

// Adicionando um valor ao dicionário
albunsDoEngenheirosDoHawaii[2004] = "Acústico MTV"
albunsDoEngenheirosDoHawaii[2000] = "10.000 Destinos"

// Removendo um valor
albunsDoEngenheirosDoHawaii.removeValue(forKey: 2000)

// Quantos elementos temos no dicionario?
albunsDoEngenheirosDoHawaii.count

// O dicionario está vazio?
albunsDoEngenheirosDoHawaii.isEmpty

// Iterando pelos elementos de um dicionário
for (ano, album) in albunsDoEngenheirosDoHawaii {
    print("\(album) foi lançado no ano de \(ano)")
}

// Declarando um dicionário
var swiftVersions : [String:Int] = ["Swift 1": 2014, "Swift 2":2015, "Swift 3":2016]

// Acessando um elemento do dicionário
swiftVersions["Swift 1"]

// Iterando nesse dicionário
for version in swiftVersions {
    print("\(version.0): \(version.1)")
}
/*: 
 Switch

 Estrutura utilizada para definir uma ação baseado em um valor
*/
var respostaFundamental = 42

switch respostaFundamental {
    case 1..<5:
        print("valores entre 1 até 4")
    case 6...17:
        print("valores entre 6 até 17")
    case 42:
        print("A resposta da vida, universo e tudo mais")
    case 56...60, 90, 100:
        print("Aleatório")
    
    default:
        print("NDA")
}

/*:
 Estruturas de repetição

 Existem algumas sintaxes possíveis para realizar repetições
 
 - For
 */

// Forma recomendada
for numero in 1...7 {
    print(numero)
}

for numero in 1..<8 {
    print(numero)
}

// Iterando ao contrário
for numero in (1...7).reversed() {
    print(numero)
}

// Modificando o passo
for numero in stride(from: 1, to: 10, by: 2) {
    print(numero)
}

/*:
 - While
 */
var numero = 0

while numero <= 6 {
    numero += 1 // recomendada
    print(numero)
}

/*: 
 - Repeat 
 */
repeat {
    print("Pelo menos uma vez", terminator: ".")
} while false

/*:
 Enum
 */

// Criando um Enum
enum Side: String {
    case L = "Light"
    case D = "Dark"
}

enum Status: Int {
    case Ativo = 0
    case Inativo = 1
    case Bloqueado = 2
}

// Utilizando um Enum
var statusUsuario: Status = Status.Ativo

print(statusUsuario)

switch(statusUsuario) {
case .Ativo:
    print("Usuário ativo! :-)")
case .Inativo:
    print("Atenção! Usuário inativo.")
case .Bloqueado:
    print("Usuário bloqueado :-(")
}

/*:
 Struct
 
 Classes e structs podem armazenar métodos e propriedades
 
 Structs não suportam herança, é mais recomendado utilizar apenas para armazenamento de informações

 */
struct Monitor {
    // Propriedades da struct
    var largura = 0
    var altura = 0
    
    // Propriedade computada
    var resolucao: String {
        return "\(self.altura)x\(self.largura)"
    }
    
    // Inicializador
    init(largura: Int, altura: Int) {
        self.largura = largura
        self.altura = altura
    }
    
    // Métodos da struct
    func quantidadeDePixels() -> Int {
        return altura * largura
    }
}

// Criando uma nova estrutura
var meuMonitor: Monitor = Monitor(largura: 600, altura: 800)

// Propriedades da estrutura
meuMonitor.largura
meuMonitor.altura
meuMonitor.resolucao

// Chamando um método da struct
meuMonitor.quantidadeDePixels()


/*:
 Classes
 
 Aqui entram os conceitos de orientação a objetos.
 
 Atributos e métodos (de instância e de classe), herança, encapsulamento, polimorfismo.
 Temos de tudo!
 
 */
// Nova classe
//  Propriedades
//  Inicializador
//  Métodos
//  Métodos de classe (static)
//  Modificadores de acesso

// Herança
//  Inicializador
//  Sobrescrita de método
//




// Nova classe Humano
class Humano {
    // Propriedades armazenadas
    let nome: String
    let sobrenome: String
    var idade: Int
    
    // Propriedades computadas
    var nomeCompleto: String {
        return "\(self.nome) \(self.sobrenome)"
    }
    
    // Inicializador
    init(nome: String, sobrenome: String, idade: Int) {
        // 'self' representa o objeto instanciado
        self.nome = nome
        self.sobrenome = sobrenome
        self.idade = idade
    }
    
    // Método
    func falar() -> String {
        return "Olá, meu nome é \(self.nomeCompleto) e eu tenho \(self.idade) anos."
    }
    
    // Método de classe
    static func isMamifero() -> Bool {
        return true
    }
}

// Herança
// Apenas herança simples
// Após o nomes da classe, coloque ':' e o nome da classe de onde herdar
class Atleta: Humano {
    var esporte: String
    
    init(nome: String, sobrenome: String, idade: Int, esporte: String) {
        self.esporte = esporte
        // Inicializador da classe pai
        super.init(nome: nome, sobrenome: sobrenome, idade: idade)
    }
    
    // Sobrescrita do método de falar do Humano
    override func falar() -> String {
        return "Meu nome é \(self.nomeCompleto), \(self.idade) anos, e eu pratico \(self.esporte)."
    }
    
    // Método do atleta apra praticar esporte
    func praticarEsporte() -> String {
        return "\(self.nome) está praticando \(self.esporte)."
    }
}

// Instanciado novos objetos
let human = Humano(nome: "Jon", sobrenome: "Doe", idade: 24)
let atlet = Atleta(nome: "Mary", sobrenome: "Jane", idade: 20, esporte: "curling")

// Vamos testar se um Atleta é um Humano
func isAtleta(pessoa: Humano) -> Bool {
    return pessoa is Atleta
}

isAtleta(pessoa: human)
isAtleta(pessoa: atlet)

// Os dois podem falar, pois os dois são Humanos
human.falar()
atlet.falar()

// Mas apenas o Atleta pratica esportes
atlet.praticarEsporte()
/*:
 Protocolos
 
 - Semelhante ao conceito de interface.
 
 - Uma classe que implementa um protocolo deve implementar os métodos que o protocolo possui
 */

protocol TriAtleta {
    var energia: Int { get set }
    
    func correr() -> String
    func nadar() -> String
    func pedalar() -> String
}

protocol Nadador {
    var folego: Int { get set }
    
    func respirar() -> Bool
    func nadarCraw()
    func nadarCostas()
    func nadarBorboleta()
    func nadarPeito()
}

class Pessoa: Atleta, TriAtleta {
    // Temos que implementar as propriedades que o protocolo pede
    var energia: Int = 10
    
    // E implementar os métodos do protocolo
    func correr() -> String {
        return "\(self.nome): Estou correndo!"
    }
    
    func nadar() -> String {
        return "\(self.nome): Estou nadando!"
    }
    
    func pedalar() -> String {
        return String("\(self.nome): Estou pedalando!")
    }
}

// Vamos testar agora
// Criamos uma função que recebe uma pessoa pra disputar o triatlo
func iniciarTriatlo(pessoa: Pessoa) {
    pessoa.correr()
    pessoa.nadar()
    pessoa.pedalar()
}

// Instaciamos um objeto da classe Pessoa
let thiago: Pessoa = Pessoa(nome: "Thiago", sobrenome: "Pereira", idade: 28, esporte: "natação")

// Iniciamos o triatlo com essa pessoa
iniciarTriatlo(pessoa: thiago)

/*:
 - callout(Exercicio): Vamos testar o que aprendemos até aqui. Modifique as classes abaixo de forma que elas implementem o protocolo do cumbustível correspondente.
 */

protocol Diesel {
    var quantidadeDeCombustível: Int { get set }
    
    func injetarArAquecido()
    func injetarCombustívelSobPressão()
}

protocol Gasolina {
    var quantidadeDeCombustível: Int { get set }
    
    func ativarVela()
    func injetarCombustívelComAr()
}

class MotorDeCarro {

}

class MotorDeCaminhão {

}








