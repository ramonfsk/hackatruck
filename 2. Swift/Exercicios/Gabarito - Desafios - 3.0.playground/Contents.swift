import UIKit

//: Desafios da aula de revisão de swift

//: 1) Desenvolva um código em Swift listando a sequência de Fibonacci

// Escreve na tela a quantidade de numeros fibonacci definida
func fibonacci(of limit: Int){
    var count = 0
    
    var prev = 0
    var num = 1
    var aux = num
    
    while(count < limit) {
        // Escreve o numero atual
        print(num)
        
        // Soma ele com o numero anterior
        num += prev
        // Atualiza o numero anterior com o numero atual
        prev = aux
        // Atualiza o aux para o numero atual
        aux = num
        
        count += 1
    }
}

fibonacci(of: 5)

// Retorna um array com n numeros de fibonacci
func fibonacciArray(with limit: Int) -> [Int]{
    var count = 0
    
    var prev = 0
    var num = 1
    var aux = num
    
    var numbers: [Int] = [Int]()
    
    while(count < limit) {
        numbers.append(num)
        
        // Soma ele com o numero anterior
        num += prev
        // Atualiza o numero anterior com o numero atual
        prev = aux
        // Atualiza o aux para o numero atual
        aux = num
        
        count += 1
    }
    
    return numbers
}

fibonacciArray(with: 5)
fibonacciArray(with: 10)


//: 2) Desenvolva um código em que, dado um número qualquer, o algoritmo diga se o mesmo é um número Armstrong ou não

func countDigits(from number:Int) -> Int {
    return String(number).characters.count
}

func getDigits(from number: Int) -> [Int] {
    // Forma simples
    /*
    var intArray:[Int] = [Int]()
    
    for c in Array(String(number).characters) {
        if let num = Int(String(c)) {
            intArray.append(num)
        }
    }

    return intArray
     */
    
    // Forma avançada
    return Array(String(number).characters).map( { Int(String($0))! } )
}

func isArmstrong(_ number:Int) -> Bool {
    // Quantidade de digitos no número
    let numberOfDigits = countDigits(from: number)
    // Se não tiver 3 digitos, já não eh
//    if numberOfDigits != 3 { return false }
    
    // Array com os digitos que formam o número
    let numberDigits = getDigits(from: number)
    
    // Realizar a somatória
    var sum = 0
    for i in numberDigits {
        // Soma os digitos elevados a n
        sum += Int(pow(Double(i), Double(numberOfDigits)))
    }
    
    // Se a soma for igual ao número, então o número eh de Armstrong
    if sum == number {
        return true
    }
    
    return false
}

isArmstrong(111)
isArmstrong(153)
isArmstrong(370)
isArmstrong(371)
isArmstrong(407)

//: 3) Escreva uma classe "MaquinaDeKaraoke" contendo um método “InsereMusica”, que insira músicas em uma lista, e outro método “RemoveMusica", que remova a música passada como argumento para o método

class MaquinaDeKaraoke {
    
    private var musicas:[String]
    
    init(musicas:[String]?){
        if let musicas = musicas {
            self.musicas = musicas
        } else {
            self.musicas = [String]()
        }
    }

    func inserir(musica:String){
        self.musicas.append(musica)
    }
    
    func remover(musica:String){
        if let index = self.musicas.index(of: musica) {
            self.musicas.remove(at: index)
        } else {
            print("A musica não existe")
        }
    }
    
    func listarMusicas() {
        print(self.musicas)
    }
}

let meuKaraoke = MaquinaDeKaraoke(musicas: nil)

meuKaraoke.inserir(musica: "Small Hands")
meuKaraoke.inserir(musica: "Heavydirtysoul")
meuKaraoke.inserir(musica: "Things that stop you dreaming")
meuKaraoke.inserir(musica: "Sirens")

meuKaraoke.listarMusicas()

meuKaraoke.remover(musica: "Heavydirtysoul")
meuKaraoke.remover(musica: "Heavydirtysoul")

meuKaraoke.listarMusicas()



//: 4) Dado um Array de números [2,4,1,3,6,4,7], desenvolva uma função que retorne os números únicos ordenados e os repetidos no final. [1,2,3,6,7,4,4].

func ordenacaoMaluca(_ numeros: [Int]) -> [Int] {
    // 1 - Contando a o numero de vezes que cada numero aparece no array
    // Para isso iremos usar um dicionário que vai registrar quantas vezes cada numero aparece
    var contadorDeOcorrencias: Dictionary<Int, Int> = Dictionary<Int, Int>()
    
    for i in numeros {
        // Se o numero ja estiver registrado, somamos 1
        if let count = contadorDeOcorrencias[i] {
            contadorDeOcorrencias[i] = count + 1
        }
        // Senão, inicializamos com 1 ocorrencia
        else {
            contadorDeOcorrencias[i] = 1
        }
    }
    
    // 2 - Agora vamos separa os numeros repetidos dos não repetidos em arrays distintos
    var repetidos = [Int]()
    var naoRepetidos = [Int]()
    // Passamos pelo dicionário de ocorrências pegando o numero em si e quantas vezes ele estava presente no array
    for (numero, count) in contadorDeOcorrencias {
        // Se o numero só aparece 1 vez, ele não se repete
        if count == 1 {
            naoRepetidos.append(numero)
        } else {
        // Se ele aparece mais de 1 vez, eel se repete\
            // Logo adicionamos ele o numero de vezes que ele se repete
            for _ in 1...count {
                repetidos.append(numero)
            }
        }
    }
    
    // 3 - Ordenamos o array de numeros nao repetidos
    naoRepetidos = naoRepetidos.sorted()
    repetidos = repetidos.sorted()
    
    return naoRepetidos + repetidos
}


// Array de entrada
let numeros = [2,4,1,3,6,4,7,5,7,8,1,2,9]

ordenacaoMaluca(numeros)

