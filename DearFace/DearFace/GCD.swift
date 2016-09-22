//
//  GCD.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import Foundation

class GCD{
    
    private init(){}
    
    ///系统延迟执行
    static func delay(_ seconds: Double, completion: @escaping ()->Void){
        DispatchQueue.main.asyncAfter(
            deadline: DispatchTime.now() + Double(Int64(Double(USEC_PER_SEC)*seconds)) / Double(NSEC_PER_SEC),
            execute: completion)
    }
    
    ///系统主进程操作事件
    static func mainAct(_ action: @escaping ()->Void){
        DispatchQueue.main.async(execute: action)
    }
    
    static let photoQueue = DispatchQueue(label: "photoQueue")
    
}


