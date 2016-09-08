//
//  GCD.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import Foundation

///系统延迟执行
func delay(seconds: Double, completion: ()->Void){
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW, Int64(Double(USEC_PER_SEC)*seconds)),
        dispatch_get_main_queue(),
        completion)
}

///系统主进程操作事件
func mainAct(action: ()->Void){
    dispatch_async(dispatch_get_main_queue(), action)
}
