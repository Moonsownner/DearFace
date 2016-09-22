//
//  AppDelegateExtension.swift
//  DearFace
//
//  Created by J HD on 8/31/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit
import Photos

extension AppDelegate{
    
    func initSystem(){
        setTheme()
        setConfig()
    }
    
    ///设置界面风格
    func setTheme(){
        
    }
    
    ///设置系统配置
    func setConfig(){
        
        //1.get all the image data to use
        GCD.photoQueue.async {
            Photo.fetchImage()
        }
        
    }
    
}
