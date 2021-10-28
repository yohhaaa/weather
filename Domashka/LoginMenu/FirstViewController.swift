
import UIKit

class FirstViewController: UIViewController,UITextFieldDelegate {
    
    
    @IBOutlet weak var login: UITextField!
    @IBOutlet weak var password: UITextField!
    
    
    @IBOutlet weak var buttonDisabler: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        login?.delegate = self
        buttonDisabler.isEnabled = false
        buttonDisabler.alpha = 0.5
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {

        let text = (login.text! as NSString).replacingCharacters(in: range, with: string)

        if text.isEmpty{
            buttonDisabler.isEnabled = false
            buttonDisabler.alpha = 0.5
        } else {
            buttonDisabler.isEnabled = true
            buttonDisabler.alpha = 1
        }
        return true
    }
    
    
    @IBAction func goToNextPage(_ sender: UIButton) {
        
        let alert = UIAlertController(title: "Alert", message: "Wrong password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { action in
        
        }
        
        
        if login.text == "login" && password.text == "password" {
            performSegue(withIdentifier: "nextPage", sender: isEditing)
        }
        
        else{
            
        alert.addAction(action)
        self.present(alert, animated: true, completion: nil)
            
        }
}
    
}
