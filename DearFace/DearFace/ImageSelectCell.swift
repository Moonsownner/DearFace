//
//  ImageSelectCell.swift
//  DearFace
//
//  Created by J HD on 16/9/9.
//  Copyright © 2016年 Joker. All rights reserved.
//

import UIKit
import Photos

class ImageSelectCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        layer.cornerRadius = 4
        backgroundColor = UIColor.clearColor()
        clipsToBounds = true
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackImage(asset: PHAsset){
        let options = PHImageRequestOptions()
        options.version = .Current
        options.resizeMode = .Fast
        options.synchronous = true
        PHImageManager.defaultManager().requestImageForAsset(
            asset,
            targetSize: ImageSelectItem.size,
            contentMode: .AspectFill,
            options: options) { (image, data) in
                let imageV = UIImageView(image: image)
                imageV.frame = CGRect(origin: CGPointZero, size: ImageSelectItem.size)
                self.backgroundView = imageV
        }
        
    }
    
}