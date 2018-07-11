//
//  customView.swift
//  intro
//
//  Created by student on 09/07/18.
//  Copyright © 2018 student. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect){
        super.init(frame: frame)
        print("Iniciou a view!")
        backgroundColor = UIColor.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("ERROR!")
    }
}
