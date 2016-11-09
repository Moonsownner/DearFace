//
//  UIColor.swift
//  DearFace
//
//  Created by J HD on 16/9/11.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

extension UIColor{
    
    convenience init(_ red: CGFloat, _ green: CGFloat, _ blue: CGFloat, alpha: CGFloat = 1){
        self.init(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
    
}

extension UIColor{
	
	/// 系统色调
	static var tint: UIColor{
		return UIColor(227, 95, 80)
	}
    
    ///默认字体颜色
    class var grayText: UIColor{
        return UIColor(153,153,153)
    }
	
	/// a transpant black color
	class var blackBackCover: UIColor{
		return UIColor(white: 0, alpha: 0.6)
	}
    
}
