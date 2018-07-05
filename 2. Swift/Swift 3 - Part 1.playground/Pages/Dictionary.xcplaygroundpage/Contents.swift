/*:
 [Indice](Indice) | [Previous](@previous) | [Next](@next)
 ****
 
 # Dictionary
 
 - Armazena associações entre chaves de um mesmo tipo e valores de um mesmo tipo
 - Não é ordenado
 - Ref: [The Swift Programming Language (Swift 3.0.1): Collection Types](https://developer.apple.com/library/content/documentation/Swift/Conceptual/Swift_Programming_Language/CollectionTypes.html#//apple_ref/doc/uid/TP40014097-CH8-ID105)
 - Ref: [We ❤︎ Swift: Dictionaries](https://www.weheartswift.com/dictionaries/)
 */
//: #### Criando um dicionário
// Criando novos dicionários vazios
var dicionarioDePalavras = Dictionary<String, String>()
var copasDoMundo = Dictionary<Int, String>()

var dicionarioStringString = [String: String]()
var constantesMatematicas = [String: Double]()

// Inicializando com valores
let produtos = [
    "Achocolatado": 12.99,
    "Sucrilhos": 5.60
]

var albunsDoLinkinPark: [Int: [String]] = [
    2000: ["Hybrid Theory"],
    2002: ["Reanimation"],
    2003: ["Meteora"],
    2007: ["Minutes to Midnight"]
]
//: #### Acessar e modificar elementos no dicionário
// O dicionário está vazio?
albunsDoLinkinPark.isEmpty

// Quantos elementos temos no dicionário?
albunsDoLinkinPark.count

// Acessando elementos do dicionário
albunsDoLinkinPark[2003]?.append("Live In Texas")

albunsDoLinkinPark[2002]

let oldValue = albunsDoLinkinPark.updateValue(["Living Things"], forKey: 2012)
//: #### Adicionando novos elementos no dicionário
albunsDoLinkinPark[2010] = ["A Thousand Suns"]
//: #### Remover elementos do dicionário
let elementoRemovido = albunsDoLinkinPark.removeValue(forKey: 2002)
//: #### Iterar no dicionário
// Podemos receber uma tupla
for (ano, albuns) in albunsDoLinkinPark {
    if albuns.count > 1 {
        let nomeDosAlbuns = albuns.joined(separator: ", ")
        print("Albuns \(nomeDosAlbuns) lançados no ano \(ano)")
    } else {
        print("Album \(albuns[0]) lançado em \(ano)")
    }
}

for tupla in albunsDoLinkinPark {
    let ano = tupla.key
    let albuns = tupla.value
}

let keys = albunsDoLinkinPark.keys.sorted()
let values = albunsDoLinkinPark.values

for ano in keys {
    print("No ano \(ano) teve album do Linkin Park na parada!")
}
/*:
 - Experiment: Imprima o nome completo de cada pessoa no array de nomes
 */
let nomes = [
    ["firstName": "Tiago", "lastName": "Pereira"],
    ["firstName": "Lucas", "lastName": "Pereira"],
    ["firstName": "Wislas", "lastName": "Souza"],
    ["firstName": "Marcelo", "lastName": "Pessoa"],
    ["firstName": "Rodrigo", "lastName": "Souza"],
    ["firstName": "Damaris", "lastName": "Sabino"],
    ["firstName": "Bruno", "lastName": "Corte"]
]

/*:
 - callout(Exercicio): Imprima o nome dos generos do dicionario abaixo e quantos filmes estão associado a ele.
 */
var filmes = [
    "Drama": ["Titanic"],
    "Suspense": ["Ilha do medo"],
    "Aventura": ["Indiana Jones", "Jurassic Park"],
    "Terror": ["Atividade Paranormal", "O Grito"],
    "Romance": ["A culpa é das estrelas"],
    "Fantasia": ["Harry Potter e o Prisioneiro de Askaban"],
    "Sci-fi": ["Star Wars: O Império Contra-Ataca", "Star-trek: Beyond"],
    "Guerra": ["O resgate do soldado Ryan", "Falcão negro em perigo"]
]

/*:
 ****
 [Previous](@previous) | [Next](@next)
 */
