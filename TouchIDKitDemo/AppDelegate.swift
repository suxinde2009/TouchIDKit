//
//  AppDelegate.swift
//  TouchIDKitDemo
//
//  Created by SuXinDe on 2020/2/26.
//  Copyright © 2020 su xinde. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "ViewController")
        window?.rootViewController = vc
        window?.makeKeyAndVisible()
        
        return true
    }

}

