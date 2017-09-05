//
//  CWUserDefaults.swift
//  ChipWars
//
//  Created by Makarov Andrey on 05/09/2017.
//  Copyright © 2017 Makarov Andrey. All rights reserved.
//

import Foundation
import SwiftKeychainWrapper

class CWUserDefaults {
    
    private static let tokenKey = "token"
    private static let usernameKey = "username"
    private static let userIdKey = "userIdKey"
    private static let introPresentedKey = "introPresented"
    
    static func saveToken(token: String?) {
        if token != nil {
            UserDefaults.standard.set(token, forKey: tokenKey)
        } else {
            UserDefaults.standard.removeObject(forKey: tokenKey)
        }
        
        UserDefaults.standard.synchronize()
    }
    
    static func token() -> String? {
        return UserDefaults.standard.object(forKey: tokenKey) as? String
    }
    
    static func saveIntroPresented(introPresented: Bool?) {
        if introPresented != nil {
            KeychainWrapper.standard.set(introPresented!, forKey: introPresentedKey)
        } else {
            KeychainWrapper.standard.removeObject(forKey: introPresentedKey)
        }
    }
    
    static func introPresented() -> Bool? {
        return KeychainWrapper.standard.bool(forKey: introPresentedKey)
    }
    
    static func saveUsername(username: String?) {
        if username != nil {
            KeychainWrapper.standard.set(username!, forKey: usernameKey)
        } else {
            KeychainWrapper.standard.removeObject(forKey: usernameKey)
        }
    }
    
    static func username() -> String? {
        return KeychainWrapper.standard.string(forKey: usernameKey)
    }
    
    static func saveUserId(userId: Int?) {
        if userId != nil {
            KeychainWrapper.standard.set(userId!, forKey: userIdKey)
        } else {
            KeychainWrapper.standard.removeObject(forKey: userIdKey)
        }
    }
    
    static func userId() -> Int? {
        return KeychainWrapper.standard.integer(forKey: userIdKey)
    }
    
    }

