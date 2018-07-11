//
//  Screen3ViewController.swift
//  exerc_11072018
//
//  Created by student on 11/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class Screen3ViewController: UIViewController {

    @IBAction func nextScreen(_ sender: Any) {
        performSegue(withIdentifier: "goBlue", sender: nil)
    }
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
