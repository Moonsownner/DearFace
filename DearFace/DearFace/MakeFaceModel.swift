//
//  MakeFaceModel.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit

///图片合成控制器模型
class MakeFaceModel {
    
    ///图片
    var image: Observable<UIImage>
    ///行数
    var sectionNum: Observable<Int>
    ///列数
    var rowNum: Observable<Int>
    
    init(){
        image = Observable<UIImage>(value: UIImage())
        sectionNum = Observable<Int>(value: 0)
        rowNum = Observable<Int>(value: 0)
    }
    
    init(image:UIImage, sectionNum: Int, rowNum: Int){
        self.image = Observable<UIImage>(value: image)
        self.sectionNum = Observable<Int>(value: sectionNum)
        self.rowNum = Observable<Int>(value: rowNum)
    }
    
}
