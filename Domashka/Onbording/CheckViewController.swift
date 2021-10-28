//
//  CheckViewController.swift
//  Domashka
//
//  Created by Алан Ахмадуллин on 18.10.2021.
//

import UIKit

class CheckViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

    }
    
    
    
    override func viewDidLayoutSubviews(){
        
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true, completion: nil)
            }
        
            else {
            let controller = storyboard?.instantiateViewController(identifier: "homeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            present(controller, animated: true, completion: nil)
        }
        
    }
}
class Core{
 static let shared = Core ()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "newUser19")
    }
    
    func setIsNotNewUser(){
        
        UserDefaults.standard.set(true, forKey: "newUser19")
    }
    
    
        
}
