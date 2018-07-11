//
//  ViewController.swift
//  intro
//
//  Created by student on 09/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let frame = CGRect(x: 0.0, y: 0.0, width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        
        let newView = CustomView(frame: frame)
        newView.backgroundColor = UIColor.black
        self.view.addSubview(newView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

