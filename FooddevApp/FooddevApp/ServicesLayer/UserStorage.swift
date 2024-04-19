//
//  UserStorage.swift
//  FooddevApp
//
//  Created by Dima on 19.04.2024.
//

import Foundation


class UserStorage{
    
    static let shared = UserStorage()
    
    var passedOnboarding: Bool{
        get{UserDefaults.standard.bool(forKey: "passedOnboarding")}
        set{UserDefaults.standard.setValue(newValue, forKey: "passedOnboarding")}
    }
}
