//
//  UserSassionManager.swift
//  homework 1
//
//  Created by Dariya on 30/12/23.
//

import Foundation

class UserSessionManager {
    
    static let shared = UserSessionManager()
    
    private init() { }
    
    func saveUserSession(_ user: PersonModel) {
        let twoMinute = Calendar.current.date(byAdding: .minute, value: 1, to: Date())!
        UserDefaultManager.shared.setValue(twoMinute, forkey: .session)
        
        let jsonEncoder = JSONEncoder()
        if let data = try? jsonEncoder.encode(user) {
            UserDefaultManager.shared.setValue(data, forkey: .person)
        }
    }
    
    func getSession() -> Date? {
        UserDefaultManager.shared.getDate(forkey: .session) 
    }
    
    func deleteSession() {
        UserDefaultManager.shared.removeObject(forkey: .session)
    }
    
    func getPersonInfo() -> PersonModel? {
        guard let data = UserDefaultManager.shared.getData(forkey: .person) else { return nil }
        let decoder = JSONDecoder()
        return try? decoder.decode(PersonModel.self, from: data)
    }
}
