import UIKit
import RealmSwift

class CreateNoteViewController: UIViewController {
    
    //MARK: Outlets
    
    @IBOutlet private weak var noteTextView: UITextView!
    @IBOutlet private weak var noteTitle: UITextField!
    @IBOutlet private weak var button: UIButton!
    
    //MARK: Properties
    
    private let realm = try! Realm()
    var notesModel = NotesModel()
    var editModel: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        editModelCheck()
    }
    
    //MARK: Methods
    
    @IBAction private func goToDetails(_ sender: Any) {
        if editModel == true {
            updateNote()
        }
        else { createNote() }
        
        navigationController?.popViewController(animated: true)
    }
    
    private func editModelCheck() {
        if editModel != nil {
            noteTitle.text = notesModel.noteName
            noteTextView.text = notesModel.noteText
            button.setTitle("Save Note", for: .normal)
        }
    }
    
    private func createNote() {
        notesModel.noteName = noteTitle.text!
        notesModel.noteText = noteTextView.text!
        notesModel.uuid = UUID().uuidString
        
        RealmManager.shared.createNote(model: notesModel)
    }
    
    private func updateNote() {
        RealmManager.shared.updateNote(model: notesModel, name: noteTitle.text!, text: noteTextView.text!)
    }
}
