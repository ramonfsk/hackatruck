//
//  ViewController.swift
//  exerc_11072018
//
//  Created by student on 11/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameScreen: UILabel!
    
    var label1 = String()
    
    @IBAction func nextScreen(_ sender: Any) {
        performSegue(withIdentifier: "goGreen", sender: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let valorLabel = segue.destination as! Screen2ViewController
        valorLabel.label2 = "Mudou!"
    }
}

