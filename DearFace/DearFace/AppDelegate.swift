//
//  AppDelegate.swift
//  DearFace
//
//  Created by Lucky on 16/2/22.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        
        initSystem()
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = UINavigationController(rootViewController: ConfigVC)
        window!.makeKeyAndVisible()
        
        return true
    }


}

