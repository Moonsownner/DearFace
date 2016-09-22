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
        backgroundColor = UIColor.clear
        clipsToBounds = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setBackImage(_ asset: PHAsset){
        let options = PHImageRequestOptions()
        options.version = .current
        options.resizeMode = .fast
        options.isSynchronous = true
        PHImageManager.default().requestImage(
            for: asset,
            targetSize: bounds.size,
            contentMode: .aspectFill,
            options: options) { (image, data) in
                let imageV = UIImageView(image: image)
                imageV.contentMode = .scaleAspectFill
                imageV.frame = CGRect(origin: CGPoint.zero, size: ImageSelectItem.size)
                self.backgroundView = imageV
        }
        
    }
    
}
