import UIKit

let matches = ["Brazil": ["Switzerland", "Costa Rica", "Serbia", "Mexico"], "Argentina": ["Iceland", "Croatia", "Nigeria", "France"]]

let turma = ["Ramon": 24, "Ramón": 22, "Lucas": 19, "Daniel": 19, "Igor": 16]

let mediaAlunos: Dictionary<String, Double> = ["Ramon": 9, "Ramón": 10, "Lucas": 10, "Daniel": 9, "Igor": 6]

for (nome, idade) in turma {
    if(idade < 18){
        print("\(nome) é menor de idade!")
    }
}

func exibiApovados(medias: Dictionary<String, Double>){
    for(nome, nota) in medias{
        if(nota >= 7){
            print("\(nome) foi aprovado com nota \(nota)!")
        }else{
            print("\(nome) nao foi aprovado com nota \(nota)!")
        }
    }
}

exibiApovados(medias: mediaAlunos)

/*for (time, adversario) in matches{
    for n in adversario{
        print("\(time) x \(n)")
    }
}

let temperatures = ["Celcius": [-2.0, -1.0, 0.0, 10.0, 20.0, 30.0]]

func celsiusToFahrenheit(celsius: Double) -> Double{
        return (celsius * (9 / 5)) + 32
}

for (key, values) in temperatures{
    for n in values{
        print(celsiusToFahrenheit(celsius: n))
    }
}*/

