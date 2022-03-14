import UIKit

class SignInViewController: UIViewController {
    
    // MARK: Outlets
    
    @IBOutlet private weak var loginField: UITextField!
    @IBOutlet private weak var passwordField: UITextField!
    @IBOutlet private weak var signInButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginField?.delegate = self
        signInButton.isEnabled = false
        signInButton.alpha = 0.5
    }
    
    // MARK: Alerts for signIn button
    
    @IBAction private func signIn(_ sender: UIButton) {
        let alert = UIAlertController(title: "Alert", message: "Wrong login or password", preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default) { action in }
            if loginField.text == "login" && passwordField.text == "password" {
                performSegue(withIdentifier: "nextPage", sender: isEditing)
            } else {
                alert.addAction(action)
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

// MARK: UITextFieldDelegate

extension SignInViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let textInField = ((loginField.text)! as NSString).replacingCharacters(in: range, with: string)
        
        signInButton.isEnabled = !textInField.isEmpty
        signInButton.alpha = textInField.isEmpty ? 0.5 : 1
        
        return true
    }
}
