//
//  ViewController.swift
//  exerc_table
//
//  Created by student on 11/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    let lista = [
            "Alisson", "Cassio", "Ederson",
            "Danilo", "Fagner", "Filipe Luis", "Marcelo",
            "Miranda", "Thiago Silva", "Marquinhos", "Geromel",
            "Casemiro", "Coutinho", "Fernandinho", "Fred", "Paulinho", "Renato Augusto", "Willian",
            "Douglas Costa", "Firmino", "Gabirel Jesus", "Neymar", "Taison"
        ]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lista.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "cell")
        celula?.textLabel?.text = lista[indexPath.row]
        
        return celula!
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

