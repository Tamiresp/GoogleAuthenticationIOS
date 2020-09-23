//
//  ReadWriteUser.swift
//  FirebaseIOS
//
//  Created by tamires.p.silva on 23/09/20.
//

import Foundation

class ReadWriteUser {
    
    class func writeData(key: String, value: Any){
        let userDefault = UserDefaults.standard
        
        userDefault.set(value, forKey: key)
        userDefault.synchronize()
    }
    
    class func readStringData(key: String) -> String{
        let userDefault = UserDefaults.standard
        
        if userDefault.object(forKey: key) == nil {
            return ""
        } else {
            return userDefault.string(forKey: key)!
        }
    }
}
