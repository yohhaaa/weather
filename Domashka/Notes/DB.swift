
import RealmSwift

// LocalOnlyQsTask is the Task model for this QuickStart
@objcMembers class NotesModel: Object {
    
    @objc dynamic var noteName: String = ""
    @objc dynamic var noteText: String = ""
    @objc dynamic var uuid = UUID().uuidString
    
    
    

      override static func primaryKey() -> String? {
        return "uuid"
      }
    
    }
    
    
    

