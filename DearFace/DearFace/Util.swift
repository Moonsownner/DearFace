//
//  Util.swift
//  DearFace
//
//  Created by J HD on 2016/11/9.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit

class Util {
	
	static func viewToImage(view: UIView) -> UIImage?{
		if let view = view as? UIScrollView{
			UIGraphicsBeginImageContextWithOptions(view.contentSize, true, view.layer.contentsScale)
		}
		else{
			UIGraphicsBeginImageContextWithOptions(view.bounds.size, true, view.layer.contentsScale)
		}
		guard let context = UIGraphicsGetCurrentContext() else{
			return nil
		}
		view.layer.render(in: context)
		let image = UIGraphicsGetImageFromCurrentImageContext()
		UIGraphicsEndImageContext()
		return image
	}
	
}
