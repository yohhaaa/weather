import UIKit
import RealmSwift

class CreateNoteViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet weak private var noteTextView: UITextView!
    @IBOutlet weak private var noteTitle: UITextField!
    @IBOutlet weak private var button: UIButton!
    
    //MARK: Properties
    
    let realm = try! Realm()
    var notesModel = NotesModel()
    var editModel: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        editModelCheck()
    }
    
    //MARK: Methods
    
    private func editModelCheck(){
        if editModel != nil{
            noteTitle.text = notesModel.noteName
            noteTextView.text = notesModel.noteText
            button.setTitle("Save Note", for: .normal)
        }
    }
    
    @IBAction func goToDetails(_ sender: Any) {
        
            if editModel == true {
                RealmManager.shared.updateNote(model: notesModel, name: noteTitle.text!, text: noteTextView.text!)
                navigationController?.popViewController(animated: true)
            
        } else {
            notesModel.noteName = noteTitle.text!
            notesModel.noteText = noteTextView.text!
            notesModel.uuid = UUID().uuidString
            
            RealmManager.shared.createNote(model: notesModel)
            navigationController?.popViewController(animated: true)
        }
    }
}
