import Foundation

class CoreModel{
    static let shared = CoreModel ()
    
    var isFirstLaunching: Bool { 
        return !UserDefaults.standard.bool(forKey: "newUser304")
    }
    
    func setisFirstLaunching() {
        UserDefaults.standard.set(true, forKey: "newUser304")
    }
}
