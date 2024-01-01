//
//  UserSassionManager.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import Foundation
class UserSessionManager {
    static let shared = UserSessionManager()
    
    private init() {
        
    }
    
    func saveUserSession() {
        let twoMinute = Calendar.current.date(byAdding: .minute, value: 2, to: Date())!
        UserDefaultManager.shared.setValue(twoMinute, forkey: .session)
    }
    
    func getSession() -> Date? {
        UserDefaultManager.shared.getObject(forkey: .session) as? Date
    }
    
    func deleteSession() {
        UserDefaultManager.shared.removeObject(forkey: .session)
    }
}
