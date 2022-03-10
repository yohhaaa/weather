import UIKit

class NewUserScreenViewController: UIViewController {

    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        if CoreModel.shared.isNewUser() {
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

