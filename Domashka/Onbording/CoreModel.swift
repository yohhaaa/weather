
import Foundation

class Core{
 static let shared = Core ()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "newUser301")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "newUser301")
    }
}
