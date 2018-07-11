//
//  Screen2ViewController.swift
//  exerc_11072018
//
//  Created by student on 11/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class Screen2ViewController: UIViewController {

    @IBAction func nexScreen(_ sender: Any) {
        performSegue(withIdentifier: "goYellow", sender: nil)
    }
    
    var label2 = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
}
