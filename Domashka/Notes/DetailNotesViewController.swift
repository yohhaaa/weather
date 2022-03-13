import UIKit
import RealmSwift

class DetailNotesViewController: UIViewController {
    
    //MARK: Properties
    
    @IBOutlet private weak var tableView: UITableView!
    private var dataBase: Results<NotesModel>!
    private var notesModel = NotesModel()
    private var realm = try! Realm()
    private var textlabel = String()
    private var detailsText = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataBase = realm.objects(NotesModel.self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }
}

// MARK: UITableViewDelegate

extension DetailNotesViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            func deleteNoteButton() { 
                RealmManager.shared.deleteNote(model: dataBase[indexPath.row])
                tableView.reloadData()
            }
            let alert = UIAlertController(title: "Warning", message: "Are you sure you want to delete this note?", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Yes", style: .destructive, handler:{action in deleteNoteButton()}))
            alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
            
            present(alert,animated: true, completion: nil)
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let edit = storyboard?.instantiateViewController(withIdentifier: "create") as? CreateNoteViewController else { return }
        
        edit.notesModel = dataBase[indexPath.row]
        edit.editModel = true
        show(edit, sender: nil)
    }
}

// MARK: UITableViewDataSource

extension DetailNotesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataBase.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "cell")
        cell.textLabel?.text = dataBase[indexPath.row].noteName
        cell.detailTextLabel?.text = dataBase[indexPath.row].noteText 
        
        return cell
    }
}
