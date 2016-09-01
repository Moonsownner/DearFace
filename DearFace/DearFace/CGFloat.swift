//
//  CGFloat.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import CoreGraphics

extension CGFloat{
    
    ///去除小数部分
    var rounded: CGFloat{
        return CGFloat(Int(self))
    }
    
}