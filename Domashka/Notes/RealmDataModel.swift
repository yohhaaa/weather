
import RealmSwift

@objcMembers class NotesModel: Object {
    
    @objc dynamic var noteName: String = ""
    @objc dynamic var noteText: String = ""
    @objc dynamic var uuid = UUID().uuidString
    
    override static func primaryKey() -> String? {
        return "uuid"
    }
}
