//
//  TestViewController.swift
//  Domashka
//
//  Created by Алан Ахмадуллин on 13.10.2021.
//

import UIKit

class TestViewController: UIViewController {
    
    
    @IBOutlet weak var label: UILabel!
    
    var lableText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text = lableText

        // Do any additional setup after loading the view.
    }
    

}
