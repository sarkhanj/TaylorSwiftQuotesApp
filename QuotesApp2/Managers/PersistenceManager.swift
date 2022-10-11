//
//  PersistenceManager.swift
//  QuotesApp2
//
//  Created by Sarkhan Jafarli on 10/11/22.
//

import UIKit

class PersistenceManager {
    static let defaults = UserDefaults.standard
    
    static func retrieveWelcome() -> Bool{
        let isWelcome = defaults.object(forKey: "welcome") as? Bool
        return isWelcome ?? false
    }
    
    static func setWelcomeToTrue(){
        defaults.set(true, forKey: "welcome")
    }
}
