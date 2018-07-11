//
//  ViewController.swift
//  exerc_10072018
//
//  Created by student on 10/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var idadeSlider: UISlider!
    @IBOutlet weak var numIdade: UILabel!
    
    @IBAction func changeAge(_ sender: Any) {
        print(idadeSlider.value.description)
        numIdade.text = idadeSlider.value.description
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

