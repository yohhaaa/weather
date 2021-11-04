
import UIKit

class SecondViewController: UIViewController {

    


    @IBOutlet weak var tableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func showCoordinationView(_ sender: Any) {
        
        performSegue(withIdentifier: "showCoord", sender: nil)
        
    }
    
    @IBAction func showCreateNote(_ sender: Any) {
    
        performSegue(withIdentifier: "createNote", sender: nil)
    
    }
    
    @IBAction func showDetailsNote(_ sender: Any) {
        
       performSegue(withIdentifier: "showNote", sender: nil)
    }
        
    
    }

