//
//  AppDelegate.swift
//  sprint 6 second retake
//
//  Created by Jonathan T. Miles on 10/17/18.
//  Copyright © 2018 Jonathan T. Miles. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        Appearance.setUpCrimsonTheme()
        
        return true
    }
    
}

