import Foundation

class CoreModel{
 static let shared = CoreModel ()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "newUser302")
    }
    
    func setIsNotNewUser(){
        UserDefaults.standard.set(true, forKey: "newUser302")
    }
}
