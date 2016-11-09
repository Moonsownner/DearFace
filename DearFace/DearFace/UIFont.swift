//
//  UIFont.swift
//  DearFace
//
//  Created by J HD on 16/9/11.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

extension UIFont{
    
    convenience init?(size: CGFloat){
        self.init(name: "HelveticaNeue-Light", size: size)
    }
    
    ///默认字体公共方法
    static func Normal(_ size: CGFloat) -> UIFont{
        return UIFont(size: size) ?? UIFont.systemFont(ofSize: size)
    }
	
	static func Bold(_ size: CGFloat) -> UIFont{
		return UIFont.boldSystemFont(ofSize: size)
	}
	
    ///提示标题字体大小
    class var hint: UIFont{
        return UIFont.Normal(12)
    }
    
    ///按钮字体大小
    class var btn: UIFont{
        return UIFont.Normal(15)
    }
    
}
