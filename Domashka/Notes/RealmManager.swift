import RealmSwift

class RealmManager {
    
    static let shared = RealmManager()
    
    private init() {}
    
    var localRealm = try! Realm()
    
    func createNote(model: NotesModel) {
        try! localRealm.write {
            localRealm.add(model)
        }
    }
    
    func deleteNote(model: NotesModel) {
        try! localRealm.write {
            localRealm.delete(model)
        }
    }
    
    func updateNote(model: NotesModel, name: String, text: String) {
        try! localRealm.write {
            model.noteName = name
            model.noteText = text
        }
    }
}
