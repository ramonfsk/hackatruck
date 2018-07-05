/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Classes e Estruturas
 
 - Forma de estruturar os dados da nossa aplicação
 - Com propriedades e métodos adicionamos funcionalidade a nossas classes e estruturas
 - Ref: [The Swift Programming Language: Classes and Structures](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/ClassesAndStructures.html#//apple_ref/doc/uid/TP40014097-CH13-ID82)
 - Ref: [The Swift Programming Language: Access Control](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/AccessControl.html#//apple_ref/doc/uid/TP40014097-CH41-ID3)
 
 Estruturas e Classes podem:
 
 - Ter propriedades que armazenam valores
 - Definir métodos para prover funcionalidade
 - Definir inicializadores
 - Implementar [protocolos](Protocol) e `extensões`
 */
/*:
 ### Estruturas
 
 - `value types`: estruturas são value types, são copiadas quando passadas para funções ou quando são associadas a variáveis e constantes
 - `memberwise initializer`: estruturas, por padrão, possuem um inicializador das propriedades 
 */
struct Monitor {
    // Propriedades armazenadas
    var largura: Int
    var altura: Int
    
    // Propriedades computadas
    var resolucao: String {
        return "\(self.altura)x\(self.largura)"
    }
    
    // Métodos
    func quantidadeDePixels() -> Int {
        return altura * largura
    }
    
    // Inicializador padrão
    init(largura: Int, altura: Int) {
        self.largura = largura
        self.altura = altura
    }
    
    // Sobrecarga de método
    init(altura: Int, proporção: Double) {
        self.altura = altura
        self.largura = Int(Double(altura) * proporção)
    }
}
//: Criando uma nova estrutura e acessando suas propriedades e métodos
var meuMonitor   = Monitor(largura: 800, altura: 600)

var outroMonitor = Monitor(altura: 600, proporção: 4/3)

// Acessando as propriedades
meuMonitor.largura
meuMonitor.altura

meuMonitor.resolucao

outroMonitor.largura

// Chamando um método
meuMonitor.quantidadeDePixels()

/*:
 ### Classes
 
 - `reference types`: objetos são passados por referência
 - `initializer`: você deve definir os inicializadores da sua classe. Ref: [The Swift Programming Language: Initialization](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/Initialization.html#//apple_ref/doc/uid/TP40014097-CH18-ID203)
 */
class Alimento {
    // 'instance properties'
    // Propriedades armazenadas
    // 'stored properties'
    let origem: String
    let sabor: String
    
    // Modificadores de acesso
    // 'public', 'internal', 'private', 'fileprivate'
    private var quantidade: Double
    
    var quantidadeSobrando: String {
        return "\(self.quantidade)%"
    }
    
    // Inicializador
    init(origem: String, sabor: String) {
        self.origem = origem
        self.sabor = sabor
        self.quantidade = 100
    }
    
    // Métodos
    func comer(_ porcentagem: Double) {
        self.quantidade -= self.quantidade * (porcentagem / 100)
    }
    
    // Métodos e propriedades estáticas
    // 'type properties' 'type methods'
    static var isComestível: Bool = true
    
    class func isAlimento(obj: AnyObject) -> Bool {
        return obj is Alimento
    }
}
/*:
 #### Herança
 
 - Herança simples
 - Após o nomes da classe, coloque ':' e o nome da classe de onde herdar
 */
// Classe pai
class Humano {
    let nome: String
    let sobrenome: String
    var idade: Int
    
    var nomeCompleto: String {
        return "\(self.nome) \(self.sobrenome)"
    }
    
    init(nome: String, sobrenome: String, idade: Int) {
        self.nome = nome
        self.sobrenome = sobrenome
        self.idade = idade
    }
    
    func falar() -> String {
        return "Olá, meu nome é \(self.nomeCompleto) e eu tenho \(self.idade) anos."
    }
}

// Classe filha
class Atleta: Humano {
    var esporte: String
    
    init(nome: String, sobrenome: String, idade: Int, esporte: String) {
        self.esporte = esporte
        
        // 'super': Classe pai
        super.init(nome: nome, sobrenome: sobrenome, idade: idade)
    }
    
    // 'override': Sobrescrita do método de falar da classe Humano
    override func falar() -> String {
        return "Meu nome é \(self.nomeCompleto), \(self.idade) anos, e eu pratico \(self.esporte)."
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

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
