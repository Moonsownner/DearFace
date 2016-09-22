//
//  UIImage.swift
//  DearFace
//
//  Created by J HD on 8/31/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit

extension UIImage{
    
    ///通过颜色生成图片
    static func fromColor(_ color: UIColor, size: CGSize = CGSize(width: 1.0, height: 1.0)) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        guard let context = UIGraphicsGetCurrentContext() else{ return nil }
        context.setFillColor(color.cgColor)
        context.fill(CGRect(origin: CGPoint.zero, size: size))
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
}
