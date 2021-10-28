

import UIKit
import RealmSwift

class CreateNoteViewController: UIViewController {
    let realm = try! Realm()
    var notesModel = NotesModel()
    var editModel: Bool?
    
    @IBOutlet weak var noteTextView: UITextView!
    @IBOutlet weak var noteTitle: UITextField!
    @IBOutlet weak var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if editModel != nil{
            noteTitle.text = notesModel.noteName
            noteTextView.text = notesModel.noteText
            button.setTitle("Save Note", for: .normal)
            
            
        }
    
    }
    
    @IBAction func goToDetails(_ sender: Any) {
        
            if editModel == true {
            print("update")
                Realmmanager.shared.updateNote(model: notesModel, name: noteTitle.text!, text: noteTextView.text!)
                
                dismiss(animated: true, completion: nil)
            
        } else
            
            {
            print("create")
            notesModel.noteName = noteTitle.text!
            notesModel.noteText = noteTextView.text!
            notesModel.uuid = UUID().uuidString
            
            Realmmanager.shared.createNote(model: notesModel)
                
                navigationController?.popViewController(animated: true)
            
        }
    
        
        
    }
    
    

}
