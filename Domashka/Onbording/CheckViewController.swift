
import UIKit

class CheckViewController: UIViewController {

    override func viewDidLayoutSubviews(){
        super.viewDidLayoutSubviews()
        if Core.shared.isNewUser() {
            
            let vc = storyboard?.instantiateViewController(identifier: "welcome") as! WelcomeViewController
            vc.modalPresentationStyle = .fullScreen
            show(vc, sender: nil)
            }
        
            else {
            let controller = storyboard?.instantiateViewController(identifier: "homeNC") as! UINavigationController
            controller.modalPresentationStyle = .fullScreen
            controller.modalTransitionStyle = .flipHorizontal
            show(controller, sender: nil)
        }
    }
}

