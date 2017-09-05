//
//  AppDelegate.swift
//  ChipWars
//
//  Created by Makarov Andrey on 04/09/2017.
//  Copyright © 2017 Makarov Andrey. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        return true
    }
    
    func changeRootViewControllerToController(controller : AnyObject)
    {
        self.window?.rootViewController = controller as? UIViewController
        self.window?.makeKeyAndVisible()
    }
}

