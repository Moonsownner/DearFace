//
//  MakeFaceUIConfig.swift
//  DearFace
//
//  Created by J HD on 16/9/10.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

///图片选择单个元素
struct ImageSelectItem {
    ///宽度
    static let width:CGFloat = 60
    ///高度
    static let height:CGFloat = 100
    ///尺寸
    static let size:CGSize = CGSize(width: ImageSelectItem.width, height: ImageSelectItem.height)
    ///间距
    static let padding:CGFloat = 4
    ///加上间距的高度
    static let rowHeight:CGFloat = ImageSelectItem.height + ImageSelectItem.padding*2
}