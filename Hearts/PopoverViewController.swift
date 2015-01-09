//
//  PopoverViewController.swift
//  Hearts
//
//  Created by Jelle Vandenbeeck on 09/01/15.
//  Copyright (c) 2015 Fousa. All rights reserved.
//

import UIKit

class PopoverViewController: UIViewController {
    
    
    @IBOutlet weak var mainLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        mainLabel.text = "Jelle Vandebeeck"
    }
    
    override var preferredContentSize: CGSize {
        get {
            var size = mainLabel.intrinsicContentSize()
            return CGSizeMake(size.width + 40.0, size.height + 20.0)
        }
        set {
            
        }
    }
    
}
