//
//  CWAuthenticationManager.swift
//  ChipWars
//
//  Created by Makarov Andrey on 05/09/2017.
//  Copyright © 2017 Makarov Andrey. All rights reserved.
//

protocol CWAuthenticationManagerDelegate {
    
    func didLogin(manager: CWAuthenticationManager)
    func didLogout(manager: CWAuthenticationManager)
    
}

class CWAuthenticationManager {
    
    var delegate: CWAuthenticationManagerDelegate?
    
    static let sharedManager = CWAuthenticationManager()
    
    func login(userName: String) {
        let token = "12zxcasr23fsdg5tasf3e12eas3"
        let userId = 1
        CWUserDefaults.saveToken(token: token)
        CWUserDefaults.saveUsername(username: userName)
        CWUserDefaults.saveUserId(userId: userId)
    }
    
    func logout() {
        CWUserDefaults.saveToken(token: nil)
        CWUserDefaults.saveUsername(username: nil)
        CWUserDefaults.saveUserId(userId: nil)
        delegate?.didLogout(manager: self)
    }
    
    func isLoggedIn() -> Bool {
        return CWUserDefaults.token() != nil
    }
}
