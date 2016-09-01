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

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        initSystem()
        
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window!.rootViewController = ImagePickerController()
        window!.makeKeyAndVisible()
        
        return true
    }


}

