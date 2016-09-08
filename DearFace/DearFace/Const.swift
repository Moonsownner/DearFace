//
//  Const.swift
//  DearFace
//
//  Created by J HD on 8/31/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit

///配置控制器
let ConfigVC = ConfigController()

///1px分割线
var OneWidth: CGFloat{
    return 1/UIScreen.mainScreen().scale
}

///屏幕宽度
var ScreenWidth: CGFloat{
    return UIScreen.mainScreen().bounds.width
}

///屏幕高度
var ScreenHeight: CGFloat{
    return UIScreen.mainScreen().bounds.height
}

///屏幕Size
var ScreenSize: CGSize{
    return UIScreen.mainScreen().bounds.size
}