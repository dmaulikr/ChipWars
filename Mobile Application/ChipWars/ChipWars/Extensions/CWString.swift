//
//  CWString.swift
//  ChipWars
//
//  Created by Makarov Andrey on 05/09/2017.
//  Copyright © 2017 Makarov Andrey. All rights reserved.
//

import Foundation

extension String {
    
    static let ok = "Ok"
    static let loginError = "LoginError"
    
    static func getLocalizedString(key: String) -> String {
        return NSLocalizedString(key, comment: "")
    }
}
