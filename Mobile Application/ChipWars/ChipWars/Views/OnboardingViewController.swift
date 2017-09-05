//
//  OnboardingViewController.swift
//  ChipWars
//
//  Created by Makarov Andrey on 04/09/2017.
//  Copyright © 2017 Makarov Andrey. All rights reserved.
//

import UIKit
import BWWalkthrough

class OnboardingViewController: UIViewController, BWWalkthroughViewControllerDelegate {
    private let blueColor = UIColor(red: 36/255.0, green: 85/255.0, blue: 149/255.0, alpha: 1)
    var verifiedUser = false
    var intro : BWWalkthroughViewController?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        if CWUserDefaults.introPresented() ?? false {
            let controllerId = CWAuthenticationManager.sharedManager.isLoggedIn() ? BattleArenaViewController.identifier : LoginViewController.identifier
            let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: controllerId)
            let appDelegate = UIApplication.shared.delegate as! AppDelegate
            appDelegate.changeRootViewControllerToController(controller: initialViewController!)
        } else {
            showIntro()
        }
    }
    
    func showIntro() {
        intro = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingContainer") as? BWWalkthroughViewController
        let page_1 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingPageOne")
        let page_2 = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "onboardingPageTwo")
        intro?.delegate = self
        intro?.add(viewController: page_1)
        intro?.add(viewController: page_2)
        
        self.present(intro!, animated: true, completion: nil)
    }
    
    func walkthroughPageDidChange(_ pageNumber: Int) {
        if pageNumber == (self.intro?.numberOfPages)! - 1 {
            self.intro?.closeButton?.backgroundColor = blueColor
            self.intro?.closeButton?.setTitleColor(UIColor.white, for: .normal)
            self.intro?.closeButton?.layer.borderColor = blueColor.cgColor
        } else {
            self.intro?.closeButton?.backgroundColor = UIColor.white
            self.intro?.closeButton?.setTitleColor(UIColor.black, for: .normal)
            self.intro?.closeButton?.layer.borderColor = UIColor.black.cgColor
            
        }
    }
    func walkthroughCloseButtonPressed() {
        CWUserDefaults.saveIntroPresented(introPresented: true)
        
        let initialViewController = self.storyboard?.instantiateViewController(withIdentifier: LoginViewController.identifier)
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        appDelegate.changeRootViewControllerToController(controller: initialViewController!)
        
    }
}
