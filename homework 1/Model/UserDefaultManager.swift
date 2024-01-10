//
//  UserDefaultManager.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import Foundation

class UserDefaultManager {
    
    enum UserDefaultKeys: String {
        case session = "userSession"
        case phone = "userPhone"
        case person = "person"
    }
    static let shared = UserDefaultManager()
    
    private init() { }
    
    func setValue(_ value: Date, forkey key: UserDefaultKeys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func setValue(_ value: Any, forkey key: UserDefaultKeys) {
        UserDefaults.standard.setValue(value, forKey: key.rawValue)
    }
    
    func getString(forkey key: UserDefaultKeys) -> String {
        return UserDefaults.standard.string(forKey: key.rawValue) ?? ""
    }
    
    func getDate(forkey key: UserDefaultKeys) -> Date? {
        return UserDefaults.standard.date(forkey: key.rawValue)
    }
    
    func getData(forkey key: UserDefaultKeys) -> Data? {
        return UserDefaults.standard.data(forKey: key.rawValue)
    }
    
    func removeObject(forkey key: UserDefaultKeys) {
        return UserDefaults.standard.removeObject(forKey: key.rawValue) 
    }
}

extension UserDefaults {
    func set(date: Date?, forkey key: String) {
        self.set(date, forKey: key)
    }
    
    func date(forkey key: String) -> Date? {
        return self.value(forKey: key) as? Date
    }
}
