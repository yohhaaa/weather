
import UIKit

class MenuViewController: UIViewController {
    
    //MARK: Menu Action Buttons
    @IBAction private func weatherButton(_ sender: Any) {
        performSegue(withIdentifier: "showCoord", sender: nil)
    }
    
    @IBAction private func createNoteButton(_ sender: Any) {
        performSegue(withIdentifier: "createNote", sender: nil)
    }
    
    @IBAction private func detailNoteButton(_ sender: Any) {
       performSegue(withIdentifier: "showNote", sender: nil)
    }
}

