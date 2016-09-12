//
//  CGSize.swift
//  DearFace
//
//  Created by J HD on 9/8/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit

extension CGSize{
    
    ///宽高比
    var ratio: CGFloat{
        return width/height
    }
    
    ///根据宽高比缩放得到新size
    func adjustedSize(size: CGSize) -> CGSize{
        let s: CGSize
        if ratio > size.ratio{
            s = CGSize(width: size.width, height: size.height/ratio)
        }
        else{
            s = CGSize(width: size.width*ratio, height: size.height)
        }
        return s
    }
    //TODO: 代码有问题
    ///根据框高比放大得到新size
    func adjustedBiggerSize(size: CGSize) -> CGSize{
        let s: CGSize
        if ratio > size.ratio{
            s = CGSize(width: size.width*ratio, height: size.height)
        }
        else{
            s = CGSize(width: size.width, height: size.height/ratio)
        }
        return s
    }
    
    ///去小数
    var roundedSize: CGSize{
        return CGSize(width: width.rounded, height: height.rounded)
    }
    
}