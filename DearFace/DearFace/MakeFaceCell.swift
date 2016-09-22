//
//  MakeFaceCell.swift
//  DearFace
//
//  Created by J HD on 9/1/16.
//  Copyright © 2016 Joker. All rights reserved.
//

import UIKit
import Photos

class MakeFaceCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
        layer.borderColor = UIColor.cyan.cgColor
        layer.borderWidth = OneWidth
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
                self.backgroundView = imageV
        }
    }
    
}
